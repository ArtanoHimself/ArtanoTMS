
import UIKit

class LeaderboardsViewController: UIViewController {
    
    enum Paddings {
        static let goBackButtonPadding: CGFloat = -50
    }
    
    var playerData: [PlayerInfo] = []
    
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
        let storage = LeaderboardsStorage()
        let data = storage.prepareTarget()
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
    
}
