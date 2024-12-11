
import UIKit

class AddReminderViewController: UIViewController {
    
    let apns = APNS()
    let reminderService = ReminderService(storage: UserDefaultsStorage() )
    
    enum Paddings {
        static let stackViewSpacing: CGFloat = 10
    }
    
    lazy var datePicker: UIDatePicker = {
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = .dateAndTime
        datepicker.preferredDatePickerStyle = .inline
        return datepicker
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.placeholder = "Enter your reminder"
        return textField
    }()
    
    lazy var addReminderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add reminder", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray4, for: .highlighted)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Paddings.stackViewSpacing
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
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
            stackView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    func componentsSetup() {
        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(addReminderButton)
        
        addReminderButton.addTarget(self, action: #selector(saveReminderAndGoBack), for: .touchUpInside)
    }
    
    func saveReminderToStorage() {
        guard let text = textField.text else { return }
        let date = datePicker.date
        
        if textField.text == "" {
            return
        } else {
            reminderService.addDataToStorage(reminderName: text, reminderDate: date)
        }
    }
    
    func createPushNotification() {
        guard let text = textField.text else { return }
        let date = datePicker.date
        if textField.text == "" {
            return
        } else {
            apns.createPushNotification(identifier: text, date: date)
        }
    }
    
    @objc func saveReminderAndGoBack() {
        saveReminderToStorage()
        createPushNotification()
        self.dismiss(animated: true)
    }
}
