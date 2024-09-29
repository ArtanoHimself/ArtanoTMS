
import UIKit

class ViewController: UIViewController {
    
    lazy var circle: UIView = {
        let myView = UIView()
        myView.backgroundColor = .blue
        myView.layer.cornerRadius = 25
        myView.frame = .init(x: view.bounds.width / 2 - 25, y: 400, width: 50, height: 50)
        return myView
    }()
    
    lazy var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI () {
        view.backgroundColor = .systemBackground
        view.addSubview(circle)
        view.addSubview(label)
        
        label.text = "I suck at coding."
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints                      = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        circle.addGestureRecognizer(tapGestureRecognizer)
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didPress))
        view.addGestureRecognizer(longPressGestureRecognizer)
        
        
    }
    
    @objc func didTap () {
        let x = CGFloat.random(in: 0...(view.bounds.width - circle.frame.width))
        let y = CGFloat.random(in: 0...(view.bounds.height - circle.frame.height))
        circle.frame.origin = CGPoint(x: x, y: y)
        circle.backgroundColor = [UIColor.red, UIColor.green, UIColor.black, UIColor.yellow, UIColor.lightGray, UIColor.orange, UIColor.systemTeal, UIColor.systemIndigo].randomElement()
    }
    
    @objc func didPress (gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            print("began")
        case .changed:
            func prikol () {
                let myView = UIView()
                let x = CGFloat.random(in: 0...(view.bounds.width - circle.frame.width))
                let y = CGFloat.random(in: 0...(view.bounds.height - circle.frame.height))
                
                myView.backgroundColor = [UIColor.red, UIColor.green, UIColor.black, UIColor.yellow, UIColor.lightGray, UIColor.orange, UIColor.systemTeal, UIColor.systemIndigo].randomElement()
                myView.layer.cornerRadius = 25
                myView.frame = .init(x: x, y: y, width: 50, height: 50)
                view.addSubview(myView)
            }
            
            if view.subviews.count >= 0 && view.subviews.count < 200 {
                prikol()
            }
        case .ended:
            if view.subviews.count == 200 {
                
                for view in view.subviews {
                    view.isHidden = true
                    label.isHidden = false
                    circle.isHidden = false
                }
            }
        case .cancelled:
            break
        case .possible:
            break
        case .failed:
            break
        @unknown default:
            break
        }
        
        
    }
}

