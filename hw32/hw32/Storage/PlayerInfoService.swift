
import Foundation

class PlayerInfoService {
    
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func addTargetToStorage(
        nickname: String,
        score: Int)
    {
        let target = PlayerInfo(nickname: nickname, score: score)
        storage.add(target: target)
    }
    
    func deleteTargetFromStorage(target: PlayerInfo) {
        storage.delete(target: target)
    }
    
    func getSortedTargets() -> [PlayerInfo] {
        storage.returnSavedTargets().sorted{ $0.score > $1.score }
    }
}

