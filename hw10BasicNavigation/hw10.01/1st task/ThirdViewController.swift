//
//  ThirdViewController.swift
//  hw10.01
//
//  Created by Artano on 7.07.24.
//

import UIKit
import SnapKit



class ThirdViewController: UIViewController {
    
    let label: UILabel = UILabel()
    let labelName: String
    
    init(labelName: String) {
        self.labelName = labelName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        label.text = labelName
        view.addSubview(label)
        label.snp.makeConstraints{
            $0.centerX.centerY.equalTo(view)
        }
    }

}
