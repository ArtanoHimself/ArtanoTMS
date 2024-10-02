
import UIKit

class ViewController: UIViewController {
    
    enum Values {
        static let timeLabelFont: CGFloat = 35
        static let changeTimeButtonCYAnchor: CGFloat = 250
    }
    
    lazy var changeTimeButton = CustomButton(name: "Change timezone")
    lazy var timeLabel = UILabel()
    var timer: Timer?
    var UTCValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        componentsSetup()
        constraintsSetup()
        labelUpdate()
    }
    
    func componentsSetup() {
        view.addSubview(changeTimeButton)
        view.addSubview(timeLabel)
        changeTimeButton.addTarget(self, action: #selector(goToCityPicker), for: .touchUpInside)
        timeLabel.font = .systemFont(ofSize: Values.timeLabelFont)
    }
    
    func constraintsSetup() {
        changeTimeButton.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            changeTimeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeTimeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                                      constant: Values.changeTimeButtonCYAnchor)
        ])
    }
    
    func setTime() {
        let date = Date()
        let calendar = Calendar.current
        let modifiedDate = calendar.date(byAdding: .hour, value: UTCValue, to: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        timeLabel.text = dateFormatter.string(from: modifiedDate ?? date)
    }
    
    func labelUpdate() {
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(updateLabelInfo),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func updateLabelInfo() {
        setTime()
    }
    
    @objc func goToCityPicker() {
        let vc = TimeChangeViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
}

extension ViewController: SaveButtonDelegate {
    func saveChanges(UTC: Int) {
        UTCValue = UTC
    }
}

