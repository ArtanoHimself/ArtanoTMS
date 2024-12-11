
import UIKit

class TodosCell: UITableViewCell {
    
    lazy var label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        configureLabel()
        prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
}
