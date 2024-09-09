
import UIKit

class ViewController: UIViewController {
    
    lazy var circle: UIView = {
        let myView = UIView()
        myView.backgroundColor = .blue
        myView.layer.cornerRadius = 25
        myView.frame = .init(x: view.bounds.width / 2 - 25, y: 400, width: 50, height: 50)
        myView.layer.cornerRadius = 25
        myView.backgroundColor = .systemIndigo
        return myView
    }()
    
    lazy var playground = UIView()
    lazy var buttonStack = UIStackView()
    lazy var downButton = ButtonForAnimation(buttonLabel: "Down")
    lazy var upButton = ButtonForAnimation(buttonLabel: "Up")
    lazy var leftButton = ButtonForAnimation(buttonLabel: "Left")
    lazy var rightButton = ButtonForAnimation(buttonLabel: "Right")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI () {
        view.backgroundColor = .systemBackground
        buttonStackSetup()
        playgroundSetup()
        playground.addSubview(circle)
    }
    
    func buttonStackSetup() {
        view.addSubview(buttonStack)
        buttonStack.translatesAutoresizingMaskIntoConstraints                                   = false
        buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive              = true
        buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive            = true
        buttonStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 10
        buttonStack.addArrangedSubview(downButton)
        buttonStack.addArrangedSubview(upButton)
        buttonStack.addArrangedSubview(leftButton)
        buttonStack.addArrangedSubview(rightButton)
        downButton.addTarget(self, action: #selector(moveDown), for: .touchUpInside)
        upButton.addTarget(self, action: #selector(moveUp), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(moveLeft), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(moveRight), for: .touchUpInside)
    }
    
    func playgroundSetup() {
        view.addSubview(playground)
        playground.layer.borderWidth = 3
        playground.layer.cornerRadius = 10
        playground.translatesAutoresizingMaskIntoConstraints = false
        playground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        playground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        playground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        playground.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -20).isActive = true
    }
    
    @objc func moveDown() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            guard let self else { return }
            
            if playground.frame.height > circle.frame.origin.y + 70 {
                circle.frame = .init(x: circle.frame.origin.x,
                                     y: circle.frame.origin.y + 20,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            } else {
                circle.frame = .init(x: circle.frame.origin.x,
                                     y: (playground.bounds.height - 50),
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            }
        })
    }
    
    @objc func moveUp() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            guard let self else { return }
            
            if circle.frame.origin.y > 20 {
                circle.frame = .init(x: circle.frame.origin.x,
                                     y: circle.frame.origin.y - 20,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            } else {
                circle.frame = .init(x: circle.frame.origin.x,
                                     y: 0,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            }
        })
    }
    
    @objc func moveLeft() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            guard let self else { return }
            
            if circle.frame.origin.x > 20 {
                circle.frame = .init(x: circle.frame.origin.x - 20,
                                     y: circle.frame.origin.y,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            } else {
                circle.frame = .init(x: 0,
                                     y: circle.frame.origin.y,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            }
        })
    }
    
    @objc func moveRight() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            guard let self else { return }
            
            if playground.frame.width > circle.frame.origin.x + 70 {
                circle.frame = .init(x: circle.frame.origin.x + 20,
                                     y: circle.frame.origin.y,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            } else {
                circle.frame = .init(x: (playground.bounds.width - 50),
                                     y: circle.frame.origin.y,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            }
        })
    }
    
}

