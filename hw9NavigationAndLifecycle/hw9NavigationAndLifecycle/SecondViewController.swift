//
//  SecondViewController.swift
//  hw9NavigationAndLifecycle
//
//  Created by Artano on 7.07.24.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    lazy var rootLabel: UILabel = UILabel()
    lazy var label1: UILabel = UILabel()
    lazy var label2: UILabel = UILabel()

          
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        view.addSubview(rootLabel)
        
        rootLabel.text = "Root Screen"
        rootLabel.textColor = .white
        rootLabel.snp.makeConstraints{
            $0.centerX.centerY.equalTo(view)
        }
        
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .purple
        vc1.view.addSubview(label1)
        
        label1.text = "Screen 1"
        label1.textColor = .white
        label1.snp.makeConstraints{
            $0.centerX.centerY.equalTo(vc1.view)
        }
        
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .systemTeal
        vc2.view.addSubview(label2)
        
        label2.text = "Screen 2"
        label2.textColor = .white
        label2.snp.makeConstraints{
            $0.centerX.centerY.equalTo(vc2.view)
        }
        
        
        navigationController?.pushViewController(vc1, animated: true)
        navigationController?.pushViewController(vc2, animated: true)

    }
}

