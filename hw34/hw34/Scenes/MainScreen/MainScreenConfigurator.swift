
import Foundation

class MainScreenConfigurator {
    
    static func configure(_ viewController: MainScreenViewController) {
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter()
        
        interactor.presenter = presenter
        presenter.mainScreenViewController = viewController
        viewController.interactor = interactor
    }
}
