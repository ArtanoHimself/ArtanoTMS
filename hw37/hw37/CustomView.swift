import UIKit

protocol ButtonTapDelegate: AnyObject {
    func labelVisibility(isOff: Bool)
}

final class CustomView: UIView {
    
    lazy var wrapper                = UIStackView()
    lazy var mainLabel              = UILabel()
    lazy var infoLabel              = UILabel()
    
    lazy var buttonsStack           = UIStackView()
    lazy var noButton: CustomButton = CustomButton(labelText: NSLocalizedString("No", comment: ""), buttonColor: .gray)
    lazy var yesButton: CustomButton = CustomButton(labelText: NSLocalizedString("Yes", comment: ""), buttonColor: .green)
    
    weak var delegate: ButtonTapDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI () {
        backgroundColor = .systemBackground
        addSubview(wrapper)
        wrapperConfig()
        noButton.addTarget(self, action: #selector(hideAndHideLabel), for: .touchUpInside)
        yesButton.addTarget(self, action: #selector(hideAndShowLabel), for: .touchUpInside)
    }
    
    private func wrapperConfig () {
        wrapper.axis      = .vertical
        wrapper.alignment = .center
        wrapper.spacing   = 20
        wrapperConstraints()
        componentsConfig()
    }
    
    private func wrapperConstraints () {
        wrapper.translatesAutoresizingMaskIntoConstraints                   = false
        wrapper.topAnchor.constraint(equalTo: topAnchor).isActive           = true
        wrapper.leadingAnchor.constraint(equalTo: leadingAnchor).isActive   = true
        wrapper.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func componentsConfig() {
        wrapper.addArrangedSubview(mainLabel)
        wrapper.addArrangedSubview(infoLabel)
        wrapper.addArrangedSubview(buttonsStack)
        
        mainLabel.text = NSLocalizedString("Attention", comment: "")
        mainLabel.font = .systemFont(ofSize: 40)
        
        infoLabel.adjustsFontSizeToFitWidth = true
        infoLabel.numberOfLines = 2
        infoLabel.text = NSLocalizedString("Hello, user, do you like this custom alert, i've just made for you?", comment: "")
        infoLabel.textAlignment = .center
        
        buttonsStack.addArrangedSubview(noButton)
        buttonsStack.addArrangedSubview(yesButton)
        buttonsStack.axis = .horizontal
        buttonsStack.setCustomSpacing(20, after: noButton)
    }
    
    @objc func hideAndShowLabel () {
        isHidden = true
        delegate?.labelVisibility(isOff: false)
    }
    
    @objc func hideAndHideLabel () {
        isHidden = true
        delegate?.labelVisibility(isOff: true)
    }
    
}
