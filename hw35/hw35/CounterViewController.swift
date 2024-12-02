
import UIKit
import Combine

class CounterViewController: UIViewController {
    
    var viewModel: CounterViewModel
    var cancelables = Set<AnyCancellable>()
    
    init(viewModel: CounterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        setupUI()
        setBindings()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        
        setConstraints()
        componentsSetup()
    }
    
    func componentsSetup() {
        stackView.addArrangedSubview(counterLabel)
        stackView.addArrangedSubview(buttonStack)
        
        buttonStack.addArrangedSubview(decrementButton)
        buttonStack.addArrangedSubview(incrementButton)
        
        incrementButton.addTarget(self, action: #selector(incrementButtonTapped), for: .touchUpInside)
        decrementButton.addTarget(self, action: #selector(decrementButtonTapped), for: .touchUpInside)
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setBindings() {
        viewModel.$countText
            .receive(on: RunLoop.main)
            .sink { [weak self] count in
                self?.counterLabel.text = count
            }
            .store(in: &cancelables)
    }
    
    @objc func decrementButtonTapped() {
        viewModel.decrement()
    }
    
    @objc func incrementButtonTapped() {
        viewModel.increment()
    }
}

