
import Foundation

class ReminderService {
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    
    func addDataToStorage(
        reminderName: String,
        reminderDate: Date)
    {
        let reminderToAdd = Reminder(reminderName: reminderName, reminderDate: reminderDate)
        storage.addDataToStorage(reminder: reminderToAdd)
    }
    
    func deleteDataFromStorage(reminder: Reminder) {
        storage.deleteDataFromStorage(reminder: reminder)
    }
    
    func getDataFromStorage() -> [Reminder] {
        storage.fetchDataFromStorage()
    }
    
}
