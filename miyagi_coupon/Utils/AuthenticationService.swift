import UIKit
import Combine
import Amplify

enum AuthenticationState {
  case nosignin
  case awaitingConfirmation(String, String)
  case signedIn
  case errored(Error)
}

public final class AuthenticationService {
    var userSession: UserSession
    var cancellable: AnyCancellable?
    
    init(userSession: UserSession) {
      self.userSession = userSession
    }
    
    func signIn(as email: String, identifiedBy password: String) -> Future<AuthenticationState, Error> {
        return Future { promise in
          _ = Amplify.Auth.signIn(username: email, password: password) {[self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                promise(.failure(error))
            case .success:
                guard let authUser = Amplify.Auth.getCurrentUser() else {
                    // sign in next step
                    do {
                        let signinResult = try result.get()
                        switch signinResult.nextStep {
                        case .confirmSignInWithNewPassword(_):
                            // first time sign in, auto reset pw where
                            // new password = old password
                            _ = Amplify.Auth.confirmSignIn(challengeResponse: password) { result in
                                switch result {
                                case .failure(let error):
                                    print(error.errorDescription)
                                    promise(.failure(error))
                                case .success:
                                    guard let authUser = Amplify.Auth.getCurrentUser() else {
                                        print("not sign in after reset password.")
                                        return
                                    }
                                    // create new `User`
                                    let user = User(id: authUser.userId,
                                                    username: nil,
                                                    email: email,
                                                    sub: authUser.userId,
                                                    phone_number: nil)
                                    
                                    // send request
                                    _ = Amplify.API.mutate(request: .create(user)) { [self] event in
                                            switch event {
                                            case .failure(let error):
                                                signOut()
                                                return promise(.failure(error))
                                            case .success(let result):
                                                switch result {
                                                case .failure(let error):
                                                    signOut()
                                                    return promise(.failure(error))
                                                case .success(let user):
                                                    setUserSessionData(user)
                                                    promise(.success(.signedIn))
                                                }
                                            }
                                    }
                                }
                            }
                        default:
                            break
                        }
                    }
                    catch {
                        print("sign in failed")
                    }
                    return
                }
                
                // sign in
                cancellable = fetchUserModel(id: authUser.userId)
                  .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                      signOut()
                      promise(.failure(error))
                    case .finished: ()
                    }
                  }, receiveValue: { user in
                    setUserSessionData(user)
                    promise(.success(.signedIn))
                  })
            }
          }
        }
    }
    
    func signOut() {
        setUserSessionData(nil)
        _ = Amplify.Auth.signOut { result in
          switch result {
          case .failure(let error):
            print(error)
          default:
            break
          }
        }
    }

    private func setUserSessionData(_ user: User?) {
        DispatchQueue.main.async {
          if let user = user {
            self.userSession.loggedInUser = user
          } else {
            self.userSession.loggedInUser = nil
          }
        }
    }

    private func fetchUserModel(id: String) -> Future<User, Error> {
        Future { promise in
            _ = Amplify.API.query(request: .get(User.self, byId: id)) { event in
                switch event {
                case .failure(let error):
                  print(error.localizedDescription)
                  promise(.failure(error))
                  return
                case .success(let result):
                  switch result {
                  case .failure(let resultError):
                    print(resultError.localizedDescription)
                    promise(.failure(resultError))
                    return
                  case .success(let user):
                    guard let user = user else {
                      print("error")
                      return
                    }
                    promise(.success(user))
                  }
                }
            }
        }
    }
}
