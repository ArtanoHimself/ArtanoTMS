
import Foundation
import RealmSwift

protocol Storage {
    func add(target: PlayerInfo)
    func returnSavedTargets() -> [PlayerInfo]
    func delete(target: PlayerInfo)
}

class RealmStorage: Storage {
    
    func add(target: PlayerInfo) {
        let realmPlayerInfoTarget = PlayerInfoRealm()
        realmPlayerInfoTarget.nickname = target.nickname
        realmPlayerInfoTarget.score = target.score
        
        guard let realm = try? Realm() else { return }
        try? realm.write {
            realm.add(realmPlayerInfoTarget)
        }
    }
    
    func returnSavedTargets() -> [PlayerInfo] {
        guard let realm = try? Realm() else { return [] }
        let data = realm.objects(PlayerInfoRealm.self)
        return data.map {
            .init(
                nickname: $0.nickname,
                score: $0.score)
        }
    }
    
    func delete(target: PlayerInfo) {
        guard let realm = try? Realm() else { return }
        if let realmPlayerInfoToDelete = realm.objects(PlayerInfoRealm.self)
            .filter("nickname == %@ AND score == %@", target.nickname,
                    target.score).first {
            try? realm.write {
                realm.delete(realmPlayerInfoToDelete)
            }
        }
    }
    
}
    
class UserDefaultsStorage: Storage {
    
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
    
    func delete(target: PlayerInfo) {
        
        var dataRecieved = returnSavedTargets()
        let targetNickName = target.nickname
        let targetScore = target.score
        guard let index = dataRecieved.firstIndex(where: {
            $0.nickname == targetNickName && $0.score == targetScore}) else { return }
        dataRecieved.remove(at: index)
        
        let encoder = JSONEncoder()
        let jsonData = try? encoder.encode(dataRecieved)
        defaults.setValue(jsonData, forKey: key)
    }
}
