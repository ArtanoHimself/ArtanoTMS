import UserNotifications
import Foundation

class APNS {
    
    private let center = UNUserNotificationCenter.current()
    
    func createPushNotification(identifier: String, date: Date) {
        let message = identifier
        let content = UNMutableNotificationContent()
        content.body = message
        content.sound = UNNotificationSound.default
        
        var dateComponents = Calendar.current.dateComponents([
            .year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,
                                                    repeats: false)
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content,
                                            trigger: trigger)
        center.add(request)
    }
    
    func deletePushNotification(identifier: [String]) {
        center.removePendingNotificationRequests(withIdentifiers: identifier)
        
    }
}
