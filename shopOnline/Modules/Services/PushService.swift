//
//  PushService.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 07/06/2024.
//

import Foundation
import UserNotifications


class PushService: NSObject {
    private override init() {}
    
    static let shared = PushService()
    
    let center = UNUserNotificationCenter.current()
    
    func begin() {
        center.delegate = self
        center.requestAuthorization(options: [.alert]) { currentGranted, error in
            print(currentGranted)
        }
    }
    func notify(text: String) {
        let content = UNMutableNotificationContent()
        content.title = "Your restore code"
        content.body = text
        let date = Date().addingTimeInterval(3)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let UUID = UUID().uuidString
        let request = UNNotificationRequest(identifier: UUID, content: content, trigger: trigger)
        center.add(request)
    }
}

extension PushService: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
}
