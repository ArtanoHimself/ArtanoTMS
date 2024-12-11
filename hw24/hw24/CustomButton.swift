

import UIKit

class CustomButton: UIButton {
    
    let name: String
    
    init(name: String) {
        self.name = name
        super.init(frame: .zero)
        buttonSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonSettings() {
        setTitle(name, for: .normal)
        setTitleColor(.systemBlue, for: .normal)
        setTitleColor(.lightGray, for: .highlighted)
    }
    
    

}
