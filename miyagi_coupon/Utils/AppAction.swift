//
//  AppAction.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/08/15.
//

import Foundation

enum AppAction {
    case login(email: String, password: String)
    case accountBehaviorDone(result: Result<User, Error>)
    case logout
    case restoreUserSession
    case restoreUserSessionDone(last: User?)
}
