//
//  SignInViewModel.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/08/07.
//

import Foundation
import Amplify
import Combine

final class SignInViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showAlert = false
    @Published var errorMessage: String = ""
    @Published var getValue: String = "guest"
    
    @Published var state = AuthenticationState.nosignin

    let authService: AuthenticationService
    var cancellable: AnyCancellable?
    
    init(userSession: UserSession) {
        authService = AuthenticationService(userSession: userSession)
        initSignInState()
    }
    
    func signIn() {
        cancellable = authService.signIn(as: self.username, identifiedBy: self.password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: asyncCompletionErrorHandler) { [self] _ in
                state = .signedIn
            }
        state = .signedIn
    }
    
    private func asyncCompletionErrorHandler(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .failure(let error):
            print(error)
            state = .errored(error)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.state = .nosignin
        }
        case .finished: ()
      }
    }
    
    func signOut() {
        authService.signOut()
        state = .nosignin
    }
    
    private func initSignInState() {
        if let _=Amplify.Auth.getCurrentUser() {
            state = .signedIn
        } else {
            state = .nosignin
        }
    }
}
