
import UIKit

class CustomButton: UIButton {
    
    enum Values {
        static let buttonWidth: CGFloat  = 25
        static let buttonHeight: CGFloat = 25
    }
    
    let image: UIImage?
    
    init(image: UIImage?) {
        self.image = image
        super.init(frame: .zero)
        buttonSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonSettings() {
        setBackgroundImage(image, for: .normal)
        widthAnchor.constraint(equalToConstant: Values.buttonWidth).isActive   = true
        heightAnchor.constraint(equalToConstant: Values.buttonHeight).isActive = true
    }
    
    
}
