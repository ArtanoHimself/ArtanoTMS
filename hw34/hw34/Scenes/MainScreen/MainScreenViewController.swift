
import UIKit

class MainScreenViewController: UIViewController {
    
    var interactor: MainScreenInteractor?
    
    lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
    }()
    
    lazy var decrementButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        return button
    }()
    
    lazy var incrementButton: UIButton = {
       let button = UIButton()
       button.setTitle("+", for: .normal)
       button.setTitleColor(.systemBlue, for: .normal)
       button.setTitleColor(.lightGray, for: .highlighted)
       return button
    }()
    
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainScreenConfigurator.configure(self)
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        
        setConstraints()
        componentsSetup()
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func componentsSetup() {
        buttonStack.addArrangedSubview(decrementButton)
        buttonStack.addArrangedSubview(incrementButton)
        
        stackView.addArrangedSubview(counterLabel)
        stackView.addArrangedSubview(buttonStack)
        
        incrementButton.addTarget(self, action: #selector(incrementTapped), for: .touchUpInside)
        decrementButton.addTarget(self, action: #selector(decrementTapped), for: .touchUpInside)
    }
    
    func displayCount(viewModel: MainScreenModels.CounterModel) {
        counterLabel.text = "\(viewModel.count)"
    }
    
    @objc func incrementTapped() {
        let request = MainScreenModels.Request.init(isValid: true)
        interactor?.updateCounter(request: request)
    }
    
    @objc func decrementTapped() {
        let request = MainScreenModels.Request.init(isValid: false)
        interactor?.updateCounter(request: request)
    }
}
