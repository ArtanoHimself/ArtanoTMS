
import UIKit

class CustomButton: UIButton {
    
    enum Values {
        static let buttonWidth: CGFloat = 100
    }
    
    let buttonTitle: String
    
    init(buttonTitle: String) {
        self.buttonTitle = buttonTitle
        super.init(frame: .zero)
        buttonSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buttonSettings() {
        widthAnchor.constraint(equalToConstant: Values.buttonWidth).isActive = true
        setTitle(buttonTitle, for: .normal)
        setTitleColor(.systemBlue, for: .normal)
        setTitleColor(.gray, for: .highlighted)
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
}
