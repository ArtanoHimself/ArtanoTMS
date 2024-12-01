
import Foundation

class MainScreenInteractor {
    
    var presenter: MainScreenPresenter?
    
    private var count = 0
    
    func updateCounter(request: MainScreenModels.Request) {
        if request.isValid {
            if count < 50 {
                count += 1
            }
        } else {
            if count > 0 {
                count -= 1
            }
        }
        
        let response = MainScreenModels.Response(newCount: count)
        presenter?.presentCount(response: response)
    }
}
