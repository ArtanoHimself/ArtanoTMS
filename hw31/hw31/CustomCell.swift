

import UIKit

class CustomCell: UITableViewCell {
    
    lazy var personInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(personInfoLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            personInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            personInfoLabel.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        personInfoLabel.text = nil
    }
}
