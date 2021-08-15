//
//  AppCommand.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/08/15.
//

import Foundation
import Combine

protocol AppCommand {
    func execute(in store: Store)
}

struct LoginAppCommand: AppCommand {
    let email: String
    let password: String

    func execute(in store: Store) {
        AuthenticationService.shared.signIn(
            as: email,
            identifiedBy: password)
        .sink(
            receiveCompletion: { complete in
                if case .failure(let error) = complete {
                    store.dispatch(
                        .accountBehaviorDone(result: .failure(error))
                    )
                }
            },
            receiveValue: { user in
                print("login command")
                store.dispatch(
                    .accountBehaviorDone(result: .success(user))
                )
            }
        )
            .store(in: &CancellableSet.shared.set)
    }
}

struct LogoutCommand: AppCommand {
    func execute(in store: Store) {
        AuthenticationService.shared.signOut()
            .sink(receiveCompletion: {_ in
            }, receiveValue: { user in
                print("logout command")
                print(user)
            })
            .store(in: &CancellableSet.shared.set)
    }
}

struct RestoreUserCommand: AppCommand {
    func execute(in store: Store) {
        if let publisher = AuthenticationService.shared.currentUser() {
            publisher.sink(receiveCompletion: { complete in
                switch complete {
                case .failure(let error):
                    print(error)
                case .finished: ()
                }
            }, receiveValue: { user in
                store.dispatch(.restoreUserSessionDone(last: user))
                print(user)
            }).store(in: &CancellableSet.shared.set)
        } else {
            store.dispatch(.restoreUserSessionDone(last: nil))
        }
    }
}
