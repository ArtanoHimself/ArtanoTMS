
import Foundation

class UserSession {
    static let shared = UserSession()
    var profileName: String
    
    private init() {
        self.profileName = "Unknown player"
    }
}
