
import Foundation
import RealmSwift

class PlayerInfoRealm: Object {
   @Persisted var nickname: String
   @Persisted var score: Int
}
