
import UIKit

class ViewController: UIViewController {
    
    enum Paddings {
        static let stackViewSpacing: CGFloat = 50
    }
    
    lazy var addReminderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add reminder", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray4, for: .highlighted)
        return button
    }()
    
    lazy var reminderListButton: UIButton = {
        let button = UIButton()
        button.setTitle("Manage reminders", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray4, for: .highlighted)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func componentsSetup() {
        stackView.addArrangedSubview(addReminderButton)
        stackView.addArrangedSubview(reminderListButton)
        
        addReminderButton.addTarget(self, action: #selector(presentAddReminderVC), for: .touchUpInside)
        reminderListButton.addTarget(self, action: #selector(presentReminderListVC), for: .touchUpInside)
    }
    
    @objc func presentAddReminderVC() {
        let vc = AddReminderViewController()
        present(vc, animated: true)
    }
    
    @objc func presentReminderListVC() {
        let vc = ReminderListViewController()
        present(vc, animated: true)
    }

}

