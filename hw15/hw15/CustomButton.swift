
import UIKit



final class CustomButton: UIButton {
    
    enum Color {
        case green
        case gray
        case red
        case orange
        case blue
    }
    
    
    private let labelText: String
    private let buttonColor: Color
    
    
    init(labelText: String,
         buttonColor: Color) {
        
        self.labelText = labelText
        self.buttonColor = buttonColor
        
        
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupButton() {
        configureLabel()
        configureBackgroundColor()
        setupButtonSize()
    }
    
    private func configureLabel() {
        self.setTitle(labelText, for: .normal)
        self.setTitleColor(.systemGray, for: .highlighted)
        
    }
    
    private func configureBackgroundColor() {
        switch buttonColor {
        case .green:
            self.backgroundColor = .systemGreen
        case .gray:
            self.backgroundColor = .darkGray
        case .red:
            self.backgroundColor = .red
        case .orange:
            self.backgroundColor = .orange
        case .blue:
            self.backgroundColor = .blue
        }
    }
    
    private func setupButtonSize() {
        self.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
