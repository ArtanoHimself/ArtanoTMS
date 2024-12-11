

import UIKit

class ReminderListViewController: UIViewController {
    
    let apns = APNS()
    let reminderService = ReminderService(storage: UserDefaultsStorage() )
    var reminderData: [Reminder] = []
    
    enum Paddings {
        static let goBackButtonCenterYAnchorConstant: CGFloat = 250
    }
    
    lazy var goBackButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go back", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray4, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var reminderList: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ReminderCellTableViewCell.self, forCellReuseIdentifier: "ReminderCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(reminderList)
        view.addSubview(goBackButton)
        
        setConstraints()
        componentsSetup()
        setDelegates()
        loadData()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
           reminderList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           reminderList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           reminderList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           reminderList.bottomAnchor.constraint(equalTo: goBackButton.topAnchor),
            
            goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goBackButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                                  constant: Paddings.goBackButtonCenterYAnchorConstant)
        ])
    }
    
    func setDelegates() {
        reminderList.delegate = self
        reminderList.dataSource = self
    }
    
    func componentsSetup() {
        goBackButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    func loadData() {
        let data = reminderService.getDataFromStorage()
        reminderData = data
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true)
    }
}

extension ReminderListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reminderData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell",
                                                 for: indexPath) as? ReminderCellTableViewCell
        
        let reminder = reminderData[indexPath.row]
        cell?.reminderLabel.text = "\(reminder.reminderName) - \(reminder.reminderDate.formatted())"
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _, _, completionHandler in
            
            let reminderToDelete = self.reminderData[indexPath.row]
            var pushNotificationToDelete: [String] = []
            pushNotificationToDelete.append(reminderToDelete.reminderName)
            
            self.reminderService.deleteDataFromStorage(reminder: reminderToDelete)
            self.apns.deletePushNotification(identifier: pushNotificationToDelete)
            self.reminderData.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .bottom)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemGray
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}
