//
//  FifthViewController.swift
//  hw10.01
//
//  Created by Artano on 7.07.24.
//

import UIKit

class FifthViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        let vc1 = FourthViewController(Person: FourthViewController.Person(name: "Pudge", surname: "Hooker", age: 12))
        vc1.view.backgroundColor = .systemCyan
        navigationController?.pushViewController(vc1, animated: true)
        
        

 
    }
    

}
