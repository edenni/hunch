//
//  UserSession.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/08/07.
//

import Combine
import SwiftUI

public final class UserSession: ObservableObject {
  @Published var loaded = false
  @Published var loggedInUser: User? {
    didSet {
      loaded = true
    }
  }

  init() {}

  init(loggedInUser: User?) {
    self.loggedInUser = loggedInUser
  }
}
