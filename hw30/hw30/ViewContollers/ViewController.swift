
import UIKit

class ViewController: UIViewController {
    
    enum Paddings {
        static let stackViewSpacing: CGFloat = 30
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Paddings.stackViewSpacing
        return stackView
    }()
    
    lazy var gameLabel = UILabel()
    lazy var newGameButton = CustomButton(buttonTitle: "New game")
    lazy var profileButton = CustomButton(buttonTitle: "Profile")
    lazy var leaderboardsButton = CustomButton(buttonTitle: "Leaderboards")
    
    var playerName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        setConstraints()
        componentsSetup()
    }
    
    private func setConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func componentsSetup() {
        stackView.addArrangedSubview(newGameButton)
        stackView.addArrangedSubview(profileButton)
        stackView.addArrangedSubview(leaderboardsButton)
        
        newGameButton.addTarget(self, action: #selector(presentGameVC), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(presentAuthVC), for: .touchUpInside)
        leaderboardsButton.addTarget(self, action: #selector(presentLeaderboardsVC), for: .touchUpInside)
    }
    
    @objc func presentGameVC() {
        let gameVC = GameScreenViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc func presentAuthVC() {
        let authVC = AuthViewController()
        navigationController?.pushViewController(authVC, animated: true)
    }
    
    @objc func presentLeaderboardsVC() {
        let leaderVC = LeaderboardsViewController()
        navigationController?.pushViewController(leaderVC, animated: true)
    }
}

