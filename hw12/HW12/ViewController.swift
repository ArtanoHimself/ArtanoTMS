import UIKit

class ViewController: UIViewController, SaveNameDelegate, SaveSurnameDelegate, SaveAgeDelegate, SaveSexDelegate, saveBirthdayDelegate {
    
    func didSaveNameInfo(name: String) {
        nameLabel.text = name
    }
    
    func didSaveSurnameInfo(surname: String) {
        surnameLabel.text = surname
    }
    
    func didSaveAgeInfo(age: String) {
        ageLabel.text = age
    }
    
    func didSaveSexInfo(sex: String) {
        sexLabel.text = sex
    }
    
    func didSaveBirthdayInfo(date: String) {
        birthdayLabel.text = date
    }
    
    lazy var profileLabel: UILabel = UILabel()
    
    lazy var wrapper: UIStackView = UIStackView()
    lazy var rowOne: UIStackView = UIStackView()
    lazy var rowTwo: UIStackView = UIStackView()
    lazy var rowThree: UIStackView = UIStackView()
    lazy var rowFour: UIStackView = UIStackView()
    lazy var rowFive: UIStackView = UIStackView()
    lazy var buttonRow: UIStackView = UIStackView()
    
    lazy var nameLabel: UILabel = UILabel()
    lazy var surnameLabel: UILabel = UILabel()
    lazy var ageLabel: UILabel = UILabel()
    lazy var sexLabel: UILabel = UILabel()
    lazy var birthdayLabel: UILabel = UILabel()
    
    lazy var editNameButton: UIButton = .init(primaryAction:
                .init(handler: { [weak self] _ in
                    self?.pushEditNameScreen()
                }))
    
    lazy var editSurnameButton: UIButton = .init(primaryAction:
                .init(handler: { [weak self] _ in
                    self?.pushEditSurnameScreen()
                }))
    
    lazy var editAgeButton: UIButton = .init(primaryAction:
                .init(handler: { [weak self] _ in
                    self?.pushEditAgeScreen()
                }))
    
    lazy var editSexButton: UIButton = .init(primaryAction:
                .init(handler: { [weak self] _ in
                    self?.pushEditSexScreen()
                }))
    
    lazy var editBirthdayButton: UIButton = .init(primaryAction:
                .init(handler: { [weak self] _ in
                    self?.pushEditBirthdayScreen()
                }))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(profileLabel)
        view.addSubview(rowOne)
        view.addSubview(rowTwo)
        view.addSubview(rowThree)
        view.addSubview(rowFour)
        view.addSubview(rowFive)
        view.addSubview(buttonRow)

        profileLabel.text = "Your profile"
        profileLabel.font = .systemFont(ofSize: 40)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        rowOne.axis = .horizontal
        rowOne.translatesAutoresizingMaskIntoConstraints = false
        rowOne.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 30).isActive = true
        rowOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  30).isActive = true
        rowOne.addArrangedSubview(createLabel(name: "Name:"))
        rowOne.addArrangedSubview(nameLabel)
        rowOne.spacing = 10
        
        rowTwo.axis = .horizontal
        rowTwo.translatesAutoresizingMaskIntoConstraints = false
        rowTwo.topAnchor.constraint(equalTo: rowOne.bottomAnchor, constant: 10).isActive = true
        rowTwo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  30).isActive = true
        rowTwo.addArrangedSubview(createLabel(name: "Surname: "))
        rowTwo.addArrangedSubview(surnameLabel)
        
        rowThree.axis = .horizontal
        rowThree.translatesAutoresizingMaskIntoConstraints = false
        rowThree.topAnchor.constraint(equalTo: rowTwo.bottomAnchor, constant: 10).isActive = true
        rowThree.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  30).isActive = true
        rowThree.addArrangedSubview(createLabel(name: "Age:"))
        rowThree.addArrangedSubview(ageLabel)
        rowThree.spacing = 10
        
        rowFour.axis = .horizontal
        rowFour.translatesAutoresizingMaskIntoConstraints = false
        rowFour.topAnchor.constraint(equalTo: rowThree.bottomAnchor, constant: 10).isActive = true
        rowFour.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  30).isActive = true
        rowFour.addArrangedSubview(createLabel(name: "Sex:"))
        rowFour.addArrangedSubview(sexLabel)
        rowFour.spacing = 10
        
        rowFive.axis = .horizontal
        rowFive.translatesAutoresizingMaskIntoConstraints = false
        rowFive.topAnchor.constraint(equalTo: rowFour.bottomAnchor, constant: 10).isActive = true
        rowFive.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  30).isActive = true
        rowFive.addArrangedSubview(createLabel(name: "Birthday:"))
        rowFive.addArrangedSubview(birthdayLabel)
        rowFive.spacing = 10
        
        buttonRow.axis = .vertical
        buttonRow.translatesAutoresizingMaskIntoConstraints = false
        buttonRow.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant:  30).isActive = true
        buttonRow.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        buttonRow.addArrangedSubview(editNameButton)
        buttonRow.addArrangedSubview(editSurnameButton)
        buttonRow.addArrangedSubview(editAgeButton)
        buttonRow.addArrangedSubview(editSexButton)
        buttonRow.addArrangedSubview(editBirthdayButton)
        buttonRow.spacing = 20
        
        
        nameLabel.text = "Enter your name"
        surnameLabel.text = "Enter your surname"
        ageLabel.text = "Enter your age"
        sexLabel.text = "Enter your sex"
        birthdayLabel.text = "Enter your birthday"
    
        
        editNameButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        editNameButton.setTitleColor(.white, for: .normal)
        
        editSurnameButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        editSurnameButton.setTitleColor(.white, for: .normal)
        
        editAgeButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        editAgeButton.setTitleColor(.white, for: .normal)
        
        editSexButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        editSexButton.setTitleColor(.white, for: .normal)
        
        editBirthdayButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        editSurnameButton.setTitleColor(.white, for: .normal)
    
    }
    
    func createLabel(name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }
    
    func pushEditNameScreen() {
        let viewController = InfoViewController(textFieldtext: nameLabel.text ?? "")
        viewController.delegateOne = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushEditSurnameScreen() {
        let viewController = InfoViewController(textFieldtext: surnameLabel.text ?? "")
        viewController.delegateTwo = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushEditAgeScreen() {
        let viewController = InfoViewController(textFieldtext: ageLabel.text ?? "")
        viewController.delegateThree = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushEditSexScreen() {
        let viewController = InfoViewController(textFieldtext: sexLabel.text ?? "")
        viewController.delegateFour = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushEditBirthdayScreen() {
        let viewcontroller = InfoViewController(textFieldtext: birthdayLabel.text ?? "")
        viewcontroller.delegateFive = self
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
