

import UIKit

class ViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your name"
        return label
    }()
    
    lazy var surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your surname"
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your age"
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var stackViewForButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 50
        return stackView
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        return button
    }()
    
    lazy var checkDataBaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Check Data", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        view.addSubview(stackViewForButtons)
        view.addSubview(saveButton)
        view.addSubview(checkDataBaseButton)
        
        setConstraints()
        componentsSetup()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackViewForButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewForButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200)
        ])
    }
    
    func componentsSetup() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(surnameLabel)
        stackView.addArrangedSubview(surnameTextField)
        stackView.addArrangedSubview(ageLabel)
        stackView.addArrangedSubview(ageTextField)
        
        stackViewForButtons.addArrangedSubview(saveButton)
        stackViewForButtons.addArrangedSubview(checkDataBaseButton)
        
        checkDataBaseButton.addTarget(self, action: #selector(presentDataController), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveData), for: .touchUpInside)
    }
    
    func clearTextFields() {
        nameTextField.text = ""
        surnameTextField.text = ""
        ageTextField.text = ""
    }
    
    @objc func presentDataController() {
        let vc = DataViewController()
        present(vc, animated: true)
    }
    
    @objc func saveData() {
        if nameTextField.text == "" || surnameTextField.text == "" || ageTextField.text == "" {
            clearTextFields()
        } else {
            
            let storage = CoreDataStorage()
            guard let name = nameTextField.text,
                  let surname = surnameTextField.text,
                  let age = ageTextField.text
            else { return }
            
            storage.addData(name: name, surname: surname, age: age)
            clearTextFields()
        }
    }
    
}
