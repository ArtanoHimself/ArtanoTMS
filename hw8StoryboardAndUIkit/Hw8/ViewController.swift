//
//  ViewController.swift
//  Hw8
//
//  Created by Artano on 3.07.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var homeLabel: UILabel = UILabel()
    lazy var usernameLabel: UILabel = UILabel()
    lazy var usernameTextField: UITextField = UITextField()
    lazy var passwordLabel: UILabel = UILabel()
    lazy var passwordTextField: UITextField = UITextField()
    lazy var loginButton: UIButton = UIButton()
    lazy var registerButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews(homeLabel, usernameLabel, usernameTextField, passwordLabel, passwordTextField, loginButton, registerButton)
        
        homeLabel.text = "My Home Control"
        homeLabel.font = .systemFont(ofSize: 35)
        homeLabel.textColor = .white
        homeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        
        usernameLabel.text = "Username"
        usernameLabel.textColor = .white
        usernameLabel.font = .systemFont(ofSize: 25)
        usernameLabel.topAnchor.constraint(equalTo: usernameTextField.topAnchor , constant: -35).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor).isActive = true
        
        
        
        usernameTextField.placeholder = "Please enter username"
        usernameTextField.textColor = .darkGray
        usernameTextField.backgroundColor = .white
        usernameTextField.layer.cornerRadius = 7
        usernameTextField.font = .systemFont(ofSize: 30)
        usernameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        
        
        passwordLabel.text = "Password"
        passwordLabel.textColor = .white
        passwordLabel.font = .systemFont(ofSize: 25)
        passwordLabel.topAnchor.constraint(equalTo: passwordTextField.topAnchor , constant: -35).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        
        
        passwordTextField.placeholder = "Please enter password"
        passwordTextField.textColor = .darkGray
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 7
        passwordTextField.font = .systemFont(ofSize: 30)
        passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.topAnchor, constant: 90).isActive = true


        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.setTitleColor(.gray, for: .highlighted)
        loginButton.layer.cornerRadius = 7
        loginButton.backgroundColor = .white
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: homeLabel.centerYAnchor, constant: 350).isActive = true
        
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.darkGray, for: .highlighted)
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor, constant: 230).isActive = true
      
        
        
        
        
        
        
        
        
        
    
 
        
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }


}

