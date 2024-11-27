
import Foundation

class UserDefaultsStorage: Storage {
    private let defaults = UserDefaults.standard
    private let key = "UserDefaultsStorage"
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func fetchDataFromStorage() -> [Reminder] {
        guard let fetchedData = defaults.data(forKey: key) else { return [] }
        guard let decodedData = try? decoder.decode([Reminder].self, from: fetchedData) else { return [] }
        return decodedData
    }
    
    func addDataToStorage(reminder: Reminder) {
        var fetchedData = fetchDataFromStorage()
        fetchedData.append(reminder)
        let jsonData = try? encoder.encode(fetchedData)
        defaults.setValue(jsonData, forKey: key)
    }
    
    func deleteDataFromStorage(reminder: Reminder) {
        var fetchedData = fetchDataFromStorage()
        let reminderName = reminder.reminderName
        let reminderDate = reminder.reminderDate
    
        guard let index = fetchedData.firstIndex(where: {
            $0.reminderName == reminderName && $0.reminderDate == reminderDate}) else { return }
        fetchedData.remove(at: index)
        
        let jsonData = try? encoder.encode(fetchedData)
        defaults.setValue(jsonData, forKey: key)
    }
}

