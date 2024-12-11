
import UIKit

class CustomButton: UIButton {
    
    enum Paddings {
        static let widthAnchor: CGFloat = 250
        static let titleLabelFont: CGFloat = 30
        static let cornerRadius: CGFloat = 5
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.init(red: 30 / 255.0,
                                                           green: 109 / 255.0,
                                                           blue: 176 / 255.0,
                                                           alpha: 1.0): UIColor.systemCyan
        }
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
    
    func buttonSettings() {
        widthAnchor.constraint(equalToConstant: Paddings.widthAnchor).isActive = true
        setTitle(buttonTitle, for: .normal)
        titleLabel?.font = .systemFont(ofSize: Paddings.titleLabelFont)
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemCyan
        layer.cornerRadius = Paddings.cornerRadius
    }
}
