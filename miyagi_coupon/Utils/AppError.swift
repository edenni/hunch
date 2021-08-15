//
//  AppError.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/08/15.
//

import Foundation

enum AppError: Error, Identifiable {
    var id: String { localizedDescription }

    case passwordWrong
}

extension AppError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .passwordWrong: return "Password Error"
        }
    }
}
