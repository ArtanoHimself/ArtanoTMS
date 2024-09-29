//
//  FourthViewController.swift
//  hw10.01
//
//  Created by Artano on 7.07.24.
//

import UIKit
import SnapKit

class FourthViewController: UIViewController {
    lazy var personInfoLabel: UILabel = UILabel()
    
    struct Person {
        var name: String
        var surname: String
        var age: Int
    }
    
    let person: Person
    
    init(Person: Person) {
        self.person = Person
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(personInfoLabel)
        
        personInfoLabel.text = "Вы - \(person.name) \(person.surname). Вам \(person.age) лет"
        personInfoLabel.snp.makeConstraints{
            $0.centerX.centerY.equalTo(view)
        }
    }


}

