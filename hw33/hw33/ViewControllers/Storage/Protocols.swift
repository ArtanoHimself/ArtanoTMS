
import Foundation

protocol Storage {
    func fetchDataFromStorage() -> [Reminder]
    func addDataToStorage(reminder: Reminder)
    func deleteDataFromStorage(reminder: Reminder)
}
