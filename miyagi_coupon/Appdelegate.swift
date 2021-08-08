//
//  Appdelegate.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/08/03.
//

import UIKit
import Amplify
import AWSCognitoAuthPlugin
import AWSAPIPlugin
import Combine

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    configureUserNotifications()
    
    do {
        try Amplify.add(plugin: AWSCognitoAuthPlugin())
        try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: AmplifyModels()))
        try Amplify.configure()
        print("Amplify configured with auth plugin")
    } catch {
        print("Failed to initialize Amplify with \(error)")
    }
    
    return true
  }
}

// MARK: - UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void
  ) {
    completionHandler([.banner, .list, .sound])
  }

  private func configureUserNotifications() {
    UNUserNotificationCenter.current().delegate = self
  }
}
