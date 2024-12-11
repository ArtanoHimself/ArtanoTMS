
import Foundation

class MainScreenPresenter {
    
    weak var mainScreenViewController: MainScreenViewController?
    
    func presentCount(response: MainScreenModels.Response) {
        let viewModel = MainScreenModels.CounterModel(count: response.newCount)
        mainScreenViewController?.displayCount(viewModel: viewModel)
    }
}
