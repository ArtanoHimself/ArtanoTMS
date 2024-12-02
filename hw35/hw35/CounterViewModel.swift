
import Foundation

class CounterViewModel {
    
    @Published private(set) var countText: String = "0"
    private var model = CounterModel()
    
    func decrement() {
        if model.count > model.minCount {
            model.count -= 1
            countText = String(model.count)
        }
    }
    
    func increment() {
        if model.count < model.maxCount {
            model.count += 1
            countText = String(model.count)
        }
    }
}
