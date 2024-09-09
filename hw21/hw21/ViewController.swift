
import UIKit

class ViewController: UIViewController {
    
    lazy var stackView          = UIStackView()
    lazy var textLabel          = UILabel()
    lazy var colorSegemented    = UISegmentedControl(items: ["black", "red", "blue"])
    lazy var fontStyleSegmented = UISegmentedControl(items: ["default", "bold"])
    lazy var underlineSegmented = UISegmentedControl(items: ["default", "underlined"])
    lazy var fillerlabel        = UILabel()
    
    lazy var buttonStack   = UIStackView()
    lazy var confirmButton = CustomButton(name: "confirm")
    lazy var resetButton   = CustomButton(name: "reset")
    
    let editableText = NSMutableAttributedString(string: "This is some sample text i just came up with. I literally don't know what to type here, so i just type random stuff until i run out of ideas.")
    let range = NSString(string: "This is some sample text i just came up with. I literally don't know what to type here, so i just type random stuff until i run out of ideas.").range(of: "This is some sample text i just came up with. I literally don't know what to type here, so i just type random stuff until i run out of ideas.")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI () {
        view.backgroundColor = .systemBackground
        stackViewSetup()
        buttonStackSetup()
        componentsSetup()
        textLabelSetup()
    }
    
    func stackViewSetup() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(fillerlabel)
        stackView.addArrangedSubview(buttonStack)
        stackView.addArrangedSubview(colorSegemented)
        stackView.addArrangedSubview(fontStyleSegmented)
        stackView.addArrangedSubview(underlineSegmented)
        
        stackView.backgroundColor = .cyan
        stackView.translatesAutoresizingMaskIntoConstraints                                        = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive            = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive                   = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive                 = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.axis    = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
    }
    
    func buttonStackSetup() {
        buttonStack.addArrangedSubview(confirmButton)
        buttonStack.addArrangedSubview(resetButton)
        
        buttonStack.axis         = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.spacing      = 10
        
        confirmButton.addTarget(self, action: #selector(confirmChanges), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetText), for: .touchUpInside)
    }
    
    func textLabelSetup() {
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints                                       = false
        textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive      = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive    = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor).isActive                  = true
        
        textLabel.numberOfLines = 0
        editableText.addAttribute(.foregroundColor, value: UIColor.red, range: .init(location: 0, length: 50))
        editableText.addAttribute(.foregroundColor, value: UIColor.green, range: .init(location: 51, length: 80))
        editableText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 20), range: .init(location: 10, length: 30))
        editableText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: .init(location: 35, length: 35))
        textLabel.attributedText = editableText
        
    }
    
    func componentsSetup() {
        colorSegemented.selectedSegmentIndex    = 0
        fontStyleSegmented.selectedSegmentIndex = 0
        underlineSegmented.selectedSegmentIndex = 0
        
    }
    
    @objc func confirmChanges () {
        if colorSegemented.selectedSegmentIndex == 0 {
            editableText.addAttribute(.foregroundColor, value: UIColor.black, range: range)
            textLabel.attributedText = editableText
        } else if colorSegemented.selectedSegmentIndex == 1 {
            editableText.addAttribute(.foregroundColor, value: UIColor.red, range: range)
            textLabel.attributedText = editableText
        } else if colorSegemented.selectedSegmentIndex == 2 {
            editableText.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
            textLabel.attributedText = editableText
        }
        
        if fontStyleSegmented.selectedSegmentIndex == 0 {
            editableText.addAttribute(.font, value: UIFont.systemFont(ofSize: 17), range: range)
            textLabel.attributedText = editableText
        } else if fontStyleSegmented.selectedSegmentIndex == 1 {
            editableText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: range)
            textLabel.attributedText = editableText
        }
        
        if underlineSegmented.selectedSegmentIndex == 0 {
            editableText.removeAttribute(.underlineStyle, range: range)
            textLabel.attributedText = editableText
        } else if underlineSegmented.selectedSegmentIndex == 1 {
            editableText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
            textLabel.attributedText = editableText
        }
    }
    
    @objc func resetText () {
        editableText.removeAttribute(.foregroundColor, range: range)
        editableText.removeAttribute(.font, range: range)
        editableText.removeAttribute(.underlineStyle, range: range)
        textLabel.attributedText = editableText
        colorSegemented.selectedSegmentIndex    = 0
        fontStyleSegmented.selectedSegmentIndex = 0
        underlineSegmented.selectedSegmentIndex = 0
    }
    
}
