
import Foundation

protocol Storage {
    func add(target: PlayerInfo)
    func returnSavedTargets() -> [PlayerInfo]
    func prepareTarget() -> [PlayerInfo]
}

class LeaderboardsStorage: Storage {
    
    private let defaults = UserDefaults.standard
    private let key = "LocalStorageKey"
    
    func returnSavedTargets() -> [PlayerInfo] {
        guard let data = defaults.data(forKey: key) else { return [] }
        let decoder = JSONDecoder()
        guard let targets = try? decoder.decode( [PlayerInfo].self , from: data) else { return [] }
        return targets
    }
    
    func add(target: PlayerInfo) {
        var currentTargets = returnSavedTargets()
        currentTargets.append(target)
        let encoder = JSONEncoder()
        let jsonData = try? encoder.encode(currentTargets)
        defaults.setValue(jsonData, forKey: key)
    }
    
    func prepareTarget() -> [PlayerInfo] {
        returnSavedTargets().sorted{ $0.score > $1.score}
    }
}
