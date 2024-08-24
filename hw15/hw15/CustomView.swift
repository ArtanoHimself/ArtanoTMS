import UIKit

protocol ButtonTapDelegate: AnyObject {
    func labelVisibility(isOff: Bool)
}

final class CustomView: UIView {
    
    lazy var wrapper                = UIStackView()
    lazy var mainLabel              = UILabel()
    lazy var infoLabel              = UILabel()
    
    lazy var buttonsStack           = UIStackView()
    lazy var ignoreButton: CustomButton = CustomButton(labelText: "Ignore", buttonColor: .gray)
    lazy var acceptButton: CustomButton = CustomButton(labelText: "Accept", buttonColor: .green)
    
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
        ignoreButton.addTarget(self, action: #selector(hide), for: .touchUpInside)
        acceptButton.addTarget(self, action: #selector(hideAndShowLabel), for: .touchUpInside)
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
        
        mainLabel.text = "Offer"
        mainLabel.font = .systemFont(ofSize: 40)
        
        infoLabel.adjustsFontSizeToFitWidth = true
        infoLabel.numberOfLines = 2
        infoLabel.text = "Hello user, do you like this custom alert, i've just made for you?"
        infoLabel.textAlignment = .center
        
        buttonsStack.addArrangedSubview(ignoreButton)
        buttonsStack.addArrangedSubview(acceptButton)
        buttonsStack.axis = .horizontal
        buttonsStack.setCustomSpacing(20, after: ignoreButton)
    }
    
    @objc func hide () {
        isHidden = true
    }
    
    @objc func hideAndShowLabel () {
        isHidden = true
        delegate?.labelVisibility(isOff: false)
    }
}
