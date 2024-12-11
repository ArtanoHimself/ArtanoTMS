
import UIKit

class LeaderboardsViewController: UIViewController {
    
    let storageService = PlayerInfoService(storage: RealmStorage() )
    var playerData: [PlayerInfo] = []
    
    enum Paddings {
        static let goBackButtonPadding: CGFloat = -50
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PlayerScoreCellTableViewCell.self, forCellReuseIdentifier: "PlayerScoreCell")
        return tableView
    }()
    
    lazy var goBackButton: CustomButton = {
        let button = CustomButton(buttonTitle: "Go back")
        button.translatesAutoresizingMaskIntoConstraints = false
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
        view.addSubview(tableView)
        view.addSubview(goBackButton)
        setConstraints()
        componentsSetup()
        setDelegates()
        updateData()
        tableView.reloadData()
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goBackButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Paddings.goBackButtonPadding),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: goBackButton.topAnchor)
        ])
    }
    
    func componentsSetup() {
        goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    func setDelegates() {
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    func updateData() {
        let data = storageService.getSortedTargets()
        playerData = data
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension LeaderboardsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                    "PlayerScoreCell",
                                                 for:
                                                    indexPath) as? PlayerScoreCellTableViewCell
        
        let playerScore = playerData[indexPath.row]
        cell?.playerInfoLabel.text = "\(playerScore.nickname) - \(playerScore.score)"
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerData.count
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _, _, completionHandler in
            
            let playerToDelete = self.playerData[indexPath.row]
            self.storageService.deleteTargetFromStorage(target: playerToDelete)
            self.playerData.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}
    
    

