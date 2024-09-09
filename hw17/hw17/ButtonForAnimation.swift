
import UIKit

class ButtonForAnimation: UIButton {
    
    private let buttonLabel: String
    
    init(buttonLabel: String) {
        self.buttonLabel = buttonLabel
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        self.setTitle(buttonLabel, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.darkGray, for: .highlighted)
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.layer.cornerRadius = 20
        self.backgroundColor = .gray
    }
}
