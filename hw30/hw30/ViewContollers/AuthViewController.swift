
import UIKit

class AuthViewController: UIViewController {
    
    enum Paddings {
        static let stackViewSpacing: CGFloat = 30
        static let nicknameFieldFont: CGFloat = 25
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Paddings.stackViewSpacing
        return stackView
    }()
    
    lazy var profileNameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name."
        textField.font = .systemFont(ofSize: Paddings.nicknameFieldFont)
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var confirmButton: CustomButton = {
        let button = CustomButton(buttonTitle: "Confirm")
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        setupConstraints()
        componentsSetup()
        addGesture()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
           stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func componentsSetup() {
        stackView.addArrangedSubview(profileNameField)
        stackView.addArrangedSubview(confirmButton)
        confirmButton.addTarget(self, action: #selector(saveName), for: .touchUpInside)
    }
    
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func saveName() {
        UserSession.shared.profileName = profileNameField.text ?? UserSession.shared.profileName
        
        if profileNameField.text == "" {
            UserSession.shared.profileName = "Unknown player"
        }
        
        navigationController?.popViewController(animated: true)
    }
}
