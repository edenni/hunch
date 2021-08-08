//
//  NotificationManager.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/08/03.
//

import Foundation
import UserNotifications
import CoreLocation

class NotificationManager: ObservableObject {
    static var shared = NotificationManager()
    
    func requestAuthorization(completion: @escaping  (Bool) -> Void) {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _  in
                completion(granted)
        }
    }
    
//    func removeScheduledNotification(shop: Shop) {
//      UNUserNotificationCenter.current()
//        .removePendingNotificationRequests(withIdentifiers: [shop.id])
//    }
    
    func scheduleNotification(shop: Shop) {
        let content = UNMutableNotificationContent()
        content.title = shop.name
        content.subtitle = ""
        content.sound = UNNotificationSound.default

        guard CLLocationManager().authorizationStatus == .authorizedAlways ||
                CLLocationManager().authorizationStatus == .authorizedWhenInUse else {
            return
        }
        
        let center = CLLocationCoordinate2D(latitude: shop.latitude, longitude: shop.longitude)
        let region = CLCircularRegion(center: center, radius: 300, identifier: shop.id)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
        
        let request = UNNotificationRequest(identifier: shop.id, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
          if let error = error {
            print(error)
          }
        }
    }
}
