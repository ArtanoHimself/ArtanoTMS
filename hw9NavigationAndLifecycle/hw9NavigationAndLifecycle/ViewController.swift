//
//  ViewController.swift
//  hw9NavigationAndLifecycle
//
//  Created by Artano on 7.07.24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var label: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        label.text = "Artano"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30)
        label.snp.makeConstraints{
            $0.centerX.centerY.equalTo(view)
        }
        
    }
    
}

