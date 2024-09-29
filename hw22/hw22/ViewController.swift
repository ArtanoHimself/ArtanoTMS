
import UIKit

class ViewController: UIViewController {
    
    enum Values {
        static let buttonStackYOffset: CGFloat = 370
        static let buttonStackSpacing: CGFloat = 10
        static let alertLabelBAOffset: CGFloat = -20
        static let cityLabelCYOffset: CGFloat  = 200
        static let iVLeadingOffset: CGFloat    = 10
        static let iVTralingOffset: CGFloat    = -10
        static let iVTopAnchorOffset: CGFloat  = 150
        static let iVBotAnchorOffset: CGFloat  = -150
        static let iVCornerRadius: CGFloat     = 20
        static let alertLabelText: String      = "I still suck at coding :("
    }
    
    lazy var cityLabel       = UILabel()
    lazy var buttonStack     = UIStackView()
    lazy var alertController = UIAlertController(
        title: "Attention, user",
        message: "Do you like this UI component i've just presented to you?",
        preferredStyle: .alert)
    
    lazy var alertButton      = CustomButton(buttonTitle: "Press me")
    lazy var cityPickerButton = CustomButton(buttonTitle: "Change city")
    lazy var setPictureButton = CustomButton(buttonTitle: "Set picture")
    lazy var alertLabel       = UILabel()
    lazy var imageView        = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        componentsSetup()
        activateConstraints()
        alertSetup()
    }
    
    func componentsSetup() {
        view.addSubview(buttonStack)
        view.addSubview(alertLabel)
        view.addSubview(cityLabel)
        view.addSubview(imageView)
        
        buttonStack.spacing = Values.buttonStackSpacing
        buttonStack.addArrangedSubview(alertButton)
        buttonStack.addArrangedSubview(cityPickerButton)
        buttonStack.addArrangedSubview(setPictureButton)
        
        alertButton.addTarget(self, action: #selector(presentAlert), for: .touchUpInside)
        cityPickerButton.addTarget(self, action: #selector(presentCityPicker), for: .touchUpInside)
        setPictureButton.addTarget(self, action: #selector(presentImagePicker), for: .touchUpInside)
        
        alertLabel.text = Values.alertLabelText
        alertLabel.isHidden = true
        
        imageView.layer.cornerRadius = Values.iVCornerRadius
        imageView.clipsToBounds = true
    }
    
    func activateConstraints() {
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        alertLabel.translatesAutoresizingMaskIntoConstraints  = false
        cityLabel.translatesAutoresizingMaskIntoConstraints   = false
        imageView.translatesAutoresizingMaskIntoConstraints   = false
        
        NSLayoutConstraint.activate([
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: Values.buttonStackYOffset),
            
            alertLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertLabel.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: Values.alertLabelBAOffset),
            
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: Values.cityLabelCYOffset),
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Values.iVLeadingOffset),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Values.iVTralingOffset),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Values.iVTopAnchorOffset),
            imageView.bottomAnchor.constraint(equalTo: alertLabel.topAnchor, constant: Values.iVBotAnchorOffset)
            ])
    }
    
    func alertSetup() {
        alertController.addAction(UIAlertAction(title: "Not really",
                                                style: .destructive,
                                                handler: { _ in
            self.dismiss(animated: true)}
                                               )
        )
        alertController.addAction(UIAlertAction(title: "Yes, i do",
                                                style: .default,
                                                handler: { _ in
            self.alertLabel.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
            self.alertLabel.isHidden = true
            }
        }
                                               )
        )
        
    }
    
    @objc func presentAlert() {
        let controller = alertController
        present(controller, animated: true)
    }
    
    @objc func presentCityPicker() {
        let vc = PickerController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func presentImagePicker() {
        let controller = UIImagePickerController()
        present(controller, animated: true)
        controller.delegate = self
    }
    
}

extension ViewController: SaveButtonDelegate {
    func saveChanges(name: String) {
        cityLabel.text = name
    }
}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
            self.dismiss(animated: true)
        }
    }
}

