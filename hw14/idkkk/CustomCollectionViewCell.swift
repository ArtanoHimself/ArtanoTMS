
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    static let identifier = "CustomCollectionViewCell"
    
    lazy var myLabel = UILabel()
    lazy var myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(image: UIImage, name: String) {
        myImageView.image = image
        myLabel.text = name
        setupUI()
    }
    
    private func setupUI() {
        addSubview(myLabel)
        myLabel.textColor = .white
        myLabel.font = .systemFont(ofSize: 25)
        myLabel.translatesAutoresizingMaskIntoConstraints                                                 = false
        myLabel.heightAnchor.constraint(equalToConstant: 25).isActive                                     = true
        myLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive         = true
        myLabel.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        addSubview(myImageView)
        myImageView.translatesAutoresizingMaskIntoConstraints                                                               = false
        myImageView.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 15).isActive                              = true
        myImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor).isActive                 = true
        myImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor).isActive               = true
        myImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor).isActive             = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        myImageView.image = nil
    }
    
    
    
    
}
