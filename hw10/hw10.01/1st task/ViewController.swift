//
//  ViewController.swift
//  hw10.01
//
//  Created by Artano on 7.07.24.
//


// Немного наверное переборщил. Сделал 5 кнопок, чтобы каждая вызывала контроллер. А в 5 отображался лейбл.текст



import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var buttonController1: UIButton = .init(primaryAction:
        .init(handler: { [weak self] _ in
            let viewControler = SecondViewController(labelName: "What is love?")
            viewControler.view.backgroundColor = .systemGreen
            self?.present(viewControler, animated: true)
        }))
    
    lazy var buttonController2: UIButton = .init(primaryAction:
        .init(handler: { [weak self] _ in
            let viewControler = SecondViewController(labelName: "Baby don't hurt me!")
            viewControler.view.backgroundColor = .systemCyan
            self?.present(viewControler, animated: true)
        }))
    
    lazy var buttonController3: UIButton = .init(primaryAction:
        .init(handler: { [weak self] _ in
            let viewControler = SecondViewController(labelName: "Don't hurt me!")
            viewControler.view.backgroundColor = .systemOrange
            self?.present(viewControler, animated: true)
        }))
    
    lazy var buttonController4: UIButton = .init(primaryAction:
        .init(handler: { [weak self] _ in
            let viewControler = SecondViewController(labelName: "No more.")
            viewControler.view.backgroundColor = .systemPink
            self?.present(viewControler, animated: true)
        }))
    
    lazy var buttonController5: UIButton = .init(primaryAction:
            .init(handler: { [weak self] _ in
                let viewControler = ThirdViewController(labelName: "Artano")
                self?.present(viewControler, animated: true)
            }))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews(buttonController1, buttonController2, buttonController3, buttonController4, buttonController5)
        view.backgroundColor = .systemTeal
        
        buttonController1.setTitleColor(.black, for: .normal)
        buttonController1.setTitle("Controller 1", for: .normal)
        buttonController1.snp.makeConstraints{
            $0.centerY.equalTo(view).offset(-60)
            $0.centerX.equalTo(view)
        }
        
        buttonController2.setTitleColor(.black, for: .normal)
        buttonController2.setTitle("Controller 2", for: .normal)
        buttonController2.snp.makeConstraints{
            $0.centerY.equalTo(view).offset(-30)
            $0.centerX.equalTo(view)
        }
        
        buttonController3.setTitleColor(.black, for: .normal)
        buttonController3.setTitle("Controller 3", for: .normal)
        buttonController3.snp.makeConstraints{
            $0.centerY.equalTo(view)
            $0.centerX.equalTo(view)
        }
        
        buttonController4.setTitleColor(.black, for: .normal)
        buttonController4.setTitle("Controller 4", for: .normal)
        buttonController4.snp.makeConstraints{
            $0.centerY.equalTo(view).offset(30)
            $0.centerX.equalTo(view)
        }
        
        buttonController5.setTitleColor(.black, for: .normal)
        buttonController5.setTitle("Controller 5", for: .normal)
        buttonController5.snp.makeConstraints{
            $0.centerY.equalTo(view).offset(60)
            $0.centerX.equalTo(view)
        }
        
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach{
            view.addSubview($0)
        }
    }
}

