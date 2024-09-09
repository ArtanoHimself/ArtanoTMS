
import UIKit

class ViewController: UIViewController {
    
    enum Values {
        static let stackviewCY: CGFloat           = 100
        static let stackviewHeight: CGFloat       = 150
        static let stackviewWidth: CGFloat        = 200
        static let stackviewCornerRadius: CGFloat = 10
        static let stackviewSpacing: CGFloat      = 20
        static let labelFont: CGFloat             = 20
        static let buttonWidth: CGFloat           = 100
        static let buttonHeight: CGFloat          = 50
        static let buttonCornerRadius: CGFloat    = 5
    }
    
    lazy var label = UILabel()
    lazy var button = UIButton()
    lazy var textField = UITextField()
    lazy var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI () {
        view.backgroundColor = .systemIndigo
        componentsSetup()
        addGesture()
        setupNotificationCenter()
    }
    
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func componentsSetup () {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints                                                    = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                               = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: Values.stackviewCY).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: Values.stackviewHeight).isActive                    = true
        stackView.widthAnchor.constraint(equalToConstant: Values.stackviewWidth).isActive                      = true
        stackView.backgroundColor    = .systemBackground
        stackView.layer.cornerRadius = Values.stackviewCornerRadius
        stackView.spacing            = Values.stackviewSpacing
        stackView.axis               = .vertical
        stackView.alignment          = .center
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(button)
        
        label.text = "Data label"
        label.font = .systemFont(ofSize: Values.labelFont)
        label.numberOfLines = 0
        
        textField.placeholder = "Enter your data"
        textField.backgroundColor = .white
        
        button.widthAnchor.constraint(equalToConstant: Values.buttonWidth).isActive   = true
        button.heightAnchor.constraint(equalToConstant: Values.buttonHeight).isActive = true
        button.setTitle("Accept", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.layer.cornerRadius = Values.buttonCornerRadius
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setupNotificationCenter () {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardIsShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardIsHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func buttonTapped () {
        if textField.text == "" {
            textField.placeholder = "Enter your data"
        } else {
            label.text = textField.text
            textField.text = ""
            textField.resignFirstResponder()
        }
    }
    
    @objc func dismissKeyboard () {
        view.endEditing(true)
    }
    
    @objc func keyboardIsShown () {
        stackView.transform = CGAffineTransform(translationX: 0, y: -100)
    }
    
    @objc func keyboardIsHidden () {
        stackView.transform = CGAffineTransform(translationX: 0, y: 0)
    }
    
}

