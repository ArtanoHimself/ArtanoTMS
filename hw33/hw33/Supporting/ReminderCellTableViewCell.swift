

import UIKit

class ReminderCellTableViewCell: UITableViewCell {
    
    lazy var reminderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(reminderLabel)
        setConstraints()
    }
    
    func setConstraints() {
        reminderLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        reminderLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reminderLabel.text = nil
        
    }

}
