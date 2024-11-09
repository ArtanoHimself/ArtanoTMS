
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
}

