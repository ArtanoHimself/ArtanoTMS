
import UIKit

class CustomCellTwo: UITableViewCell {
    
    lazy var labelOne = UILabel()
    lazy var labelTwo = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(labelOne)
        addSubview(labelTwo)
        
        configureLabelOne()
        configureLabelTwo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabelOne() {
        labelOne.translatesAutoresizingMaskIntoConstraints                                = false
        labelOne.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                = true
        labelOne.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive   = true
    }
    
    private func configureLabelTwo() {
        labelTwo.translatesAutoresizingMaskIntoConstraints                                     = false
        labelTwo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                     = true
        labelTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20 ).isActive   = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelOne.text = nil
        labelTwo.text = nil
    }
}
