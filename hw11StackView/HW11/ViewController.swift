import UIKit

class ViewController: UIViewController {
    
    lazy var rowOne: UIStackView = UIStackView()
    lazy var rowTwo: UIStackView = UIStackView()
    lazy var rowThree: UIStackView = UIStackView()
    lazy var rowFour: UIStackView = UIStackView()
    lazy var rowFive: UIStackView = UIStackView()
    lazy var wrapper: UIStackView = UIStackView()
    lazy var zeroButton: UIButton = UIButton()
    lazy var resultLabel: UILabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(wrapper)
        view.addSubview(resultLabel)
        
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        wrapper.axis = .vertical
        wrapper.spacing = 10
        addRowsInWrapper(rowOne, rowTwo, rowThree, rowFour, rowFive)
        wrapper.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        wrapper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        zeroButton.setTitle("0", for: .normal)
        zeroButton.widthAnchor.constraint(equalToConstant: 170).isActive = true
        zeroButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        zeroButton.backgroundColor = .darkGray
        zeroButton.layer.cornerRadius = 40
        zeroButton.titleLabel?.font = .systemFont(ofSize: 40)
        
        rowOne.spacing = 10
        rowOne.addArrangedSubview(addLightGrayButton(buttonTitle: "AC"))
        rowOne.addArrangedSubview(addLightGrayButton(buttonTitle: "±"))
        rowOne.addArrangedSubview(addLightGrayButton(buttonTitle: "%"))
        rowOne.addArrangedSubview(addLightGrayButton(buttonTitle: "÷"))
        
        rowTwo.spacing = 10
        rowTwo.addArrangedSubview(addDarkGrayButton(buttonTitle: "7"))
        rowTwo.addArrangedSubview(addDarkGrayButton(buttonTitle: "8"))
        rowTwo.addArrangedSubview(addDarkGrayButton(buttonTitle: "9"))
        rowTwo.addArrangedSubview(addOrangeButton(buttonTitle: "×"))
        
        rowThree.spacing = 10
        rowThree.addArrangedSubview(addDarkGrayButton(buttonTitle: "4"))
        rowThree.addArrangedSubview(addDarkGrayButton(buttonTitle: "5"))
        rowThree.addArrangedSubview(addDarkGrayButton(buttonTitle: "6"))
        rowThree.addArrangedSubview(addOrangeButton(buttonTitle: "-"))
        
        rowFour.spacing = 10
        rowFour.addArrangedSubview(addDarkGrayButton(buttonTitle: "1"))
        rowFour.addArrangedSubview(addDarkGrayButton(buttonTitle: "2"))
        rowFour.addArrangedSubview(addDarkGrayButton(buttonTitle: "3"))
        rowFour.addArrangedSubview(addOrangeButton(buttonTitle: "+"))
        
        
        rowFive.spacing = 10
        rowFive.addArrangedSubview(zeroButton)
        rowFive.addArrangedSubview(addDarkGrayButton(buttonTitle: ","))
        rowFive.addArrangedSubview(addOrangeButton(buttonTitle: "="))
        
        
        resultLabel.text = "525"
        resultLabel.font = .systemFont(ofSize: 85)
        resultLabel.textColor = .white
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.bottomAnchor.constraint(equalTo: wrapper.topAnchor, constant: -10).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 210).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    
    func addOrangeButton(buttonTitle: String) -> UIButton {
        let button = UIButton()
        button.setTitle(buttonTitle, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 40
        button.titleLabel?.font = .systemFont(ofSize: 40)
        return button
    }
    
    func addDarkGrayButton(buttonTitle: String) -> UIButton {
        let button = UIButton()
        button.setTitle(buttonTitle, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.titleLabel?.font = .systemFont(ofSize: 40)
        return button
    }
    
    func addLightGrayButton(buttonTitle: String) -> UIButton {
        let button = UIButton()
        button.setTitle(buttonTitle, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 40
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitleColor(.black, for: .normal)
        return button
    }
    
    func addRowsInWrapper(_ rows: UIStackView...) {
        rows.forEach{wrapper.addArrangedSubview($0)
        }
    }

}

