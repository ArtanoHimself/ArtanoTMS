
import UIKit

class CustomButton: UIButton {
    
    private let name: String
    
    init(name: String) {
        self.name = name
        super.init(frame: .zero)
        buttonSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonSetup() {
        self.setTitle(name, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.systemGray3, for: .highlighted)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        
    }
    

}
