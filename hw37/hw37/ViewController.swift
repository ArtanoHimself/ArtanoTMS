import UIKit

class ViewController: UIViewController {

    lazy var someButton: UIButton = .init()
    lazy var infoLabel = UILabel()
    lazy var customAlert: CustomView = CustomView.init(frame: .init(x: 20, y: 300, width: 350, height: 200))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        buttonConfig()
        labelSetup()
        view.addSubview(customAlert)
        customAlert.isHidden = true
        customAlert.delegate = self
    }
    
    func buttonConfig() {
        view.addSubview(someButton)
        setButtonConstraints()
        buttonLook()
        someButton.addTarget(self, action: #selector(showAndHide), for: .touchUpInside)
        
    }
    
    func setButtonConstraints() {
        someButton.translatesAutoresizingMaskIntoConstraints                                     = false
        someButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                = true
        someButton.centerYAnchor.constraint(equalTo: view.centerYAnchor ,constant: 300).isActive = true
        someButton.heightAnchor.constraint(equalToConstant: 40).isActive                         = true
        someButton.widthAnchor.constraint(equalToConstant: 100).isActive                         = true
    }
    
    func buttonLook() {
        someButton.setTitle(NSLocalizedString("Press me", comment: ""), for: .normal)
        someButton.titleLabel?.adjustsFontSizeToFitWidth = true
        someButton.setTitleColor(.black, for: .normal)
        someButton.setTitleColor(.gray, for: .highlighted)
        someButton.backgroundColor = .lightGray
        someButton.layer.cornerRadius = 20
    }
    
    func labelSetup() {
        view.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints                      = false
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        infoLabel.text = NSLocalizedString("Thanks, buddy, appreciate that", comment: "")
        infoLabel.textColor = .systemBackground
        infoLabel.isHidden = true
    }
        
    @objc func showAndHide() {
        customAlert.isHidden.toggle()
        infoLabel.isHidden = true
    }
}

extension ViewController: ButtonTapDelegate {
    func labelVisibility(isOff: Bool) {
        infoLabel.isHidden = isOff
    }
}


