
import UIKit

class GameScreenViewController: UIViewController {
    
    let infoService = PlayerInfoService(storage: RealmStorage() )
    var timeLeftTimer: Timer?
    var correctAnswer: Int = 0
    var timeLeft: Int = 20
    var currentScore: Int = 0
    var playerProfileName: String = ""
    
    enum Paddings {
        static let stackViewForButtonsSpacing: CGFloat = 20
        static let timerLabelTopAnchorConstant: CGFloat = 60
        static let timerLabelFont: CGFloat = 25
        static let infoLabelFont: CGFloat = 20
        static let exampleLabelFont: CGFloat = 40
        static let scoreLabelTopAnchorConstant: CGFloat = 10
        static let blueViewBottomAnchorConstant: CGFloat = 130
        static let infoLabelBottomAnchorConstant: CGFloat = 50
        static let answerFieldFont: CGFloat = 20
        static let stackViewForLabelsTopAnchorConstant: CGFloat = -50
    }
    
    lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Paddings.timerLabelFont)
        label.text = "Time left: \(timeLeft)"
        label.textColor = .black
        label.textColor = .systemBackground
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBackground
        label.text = "Current score: \(currentScore)"
        return label
    }()
    
    lazy var blueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemCyan
        return view
    }()
    
    lazy var stackViewForLabels: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Paddings.infoLabelFont)
        return label
    }()
    
    lazy var exampleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Paddings.exampleLabelFont)
        return label
    }()
    
    lazy var answerField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your answer"
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: Paddings.answerFieldFont)
        return textField
    }()
    
    lazy var stackViewForButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Paddings.stackViewForButtonsSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var checkButton: CustomButton = {
        let button = CustomButton(buttonTitle: "Check answer")
        return button
    }()
    
    lazy var endGameButton: CustomButton = {
        let button = CustomButton(buttonTitle: "End game")
        button.backgroundColor = .systemMint
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
        view.addSubview(blueView)
        view.addSubview(timerLabel)
        view.addSubview(infoLabel)
        view.addSubview(stackViewForLabels)
        view.addSubview(stackViewForButtons)
        view.addSubview(scoreLabel)
        
        componentsSetup()
        setConstraints()
        newExample()
        addGesture()
        startTimeLeftTimer()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.bottomAnchor.constraint(equalTo: view.topAnchor,
                                             constant: Paddings.blueViewBottomAnchorConstant),
            
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.topAnchor.constraint(equalTo: view.topAnchor,
                                            constant: Paddings.timerLabelTopAnchorConstant),
            
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor,
                                            constant: Paddings.scoreLabelTopAnchorConstant),
            
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor,
                                           constant: Paddings.infoLabelBottomAnchorConstant),
            
            stackViewForLabels.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewForLabels.bottomAnchor.constraint(equalTo: stackViewForButtons.topAnchor,
                                                       constant: Paddings.stackViewForLabelsTopAnchorConstant),
            
            stackViewForButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewForButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func componentsSetup() {
        stackViewForLabels.addArrangedSubview(exampleLabel)
        stackViewForLabels.addArrangedSubview(answerField)
    
        stackViewForButtons.addArrangedSubview(checkButton)
        stackViewForButtons.addArrangedSubview(endGameButton)
        
        checkButton.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        endGameButton.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
    }
    
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func newExample() {
        let (example, answer) = generateMathematicalOperation()
        exampleLabel.text = example
        correctAnswer = answer
    }
    
    func startTimeLeftTimer() {
        timeLeftTimer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timerAction),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func hideUI() {
        infoLabel.isHidden = false
        exampleLabel.isHidden = true
        answerField.isHidden = true
        checkButton.isHidden = true
    }
    
    @objc func saveScore() {
        infoService.addTargetToStorage(nickname: UserSession.shared.profileName, score: currentScore)
    }
    
    @objc func timerAction() {
        timeLeft -= 1
        timerLabel.text = "Time left: \(timeLeft)"
        if timeLeft == 0 {
            infoLabel.text = "Game over. Your score is \(currentScore)"
            hideUI()
            dismissKeyboard()
            saveScore()
            timeLeftTimer?.invalidate()
        }
    }
    
    @objc func checkAnswer() {
        guard let answerFieldText = answerField.text,
              let userAnswer = Int(answerFieldText) else {
            infoLabel.isHidden = false
            infoLabel.text = "Enter correct answer."
            answerField.text = ""
            return
        }
        
        if userAnswer == correctAnswer {
            infoLabel.text = "Correct!"
            infoLabel.isHidden = false
            currentScore = currentScore + timeLeft
            scoreLabel.text = "Current score: \(currentScore)"
            timeLeft += 5
            newExample()
        } else {
            infoLabel.isHidden = false
            infoLabel.text = "Incorrect."
        }
        answerField.text = ""
    }
    
    @objc func dismissController() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    deinit {
        timeLeftTimer?.invalidate()
    }
    
}
