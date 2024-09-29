//
//  InfoViewController.swift
//  HW12
//
//  Created by Artano on 24.07.24.
//

import UIKit

protocol SaveNameDelegate: AnyObject {
    func didSaveNameInfo(name: String)
}

protocol SaveSurnameDelegate: AnyObject {
    func didSaveSurnameInfo(surname: String)
}

protocol SaveAgeDelegate: AnyObject {
    func didSaveAgeInfo(age: String)
}

protocol SaveSexDelegate: AnyObject {
    func didSaveSexInfo(sex: String)
}

protocol saveBirthdayDelegate: AnyObject {
    func didSaveBirthdayInfo(date: String)
}


class InfoViewController: UIViewController {
    
    lazy var editLabel: UILabel = UILabel()
    lazy var editField: UITextField = UITextField()
    lazy var saveButton: UIButton = .init(primaryAction:
            .init(handler: { [weak self] _ in
                self?.saveAndReturnToProfile()
            }))
    
    weak var delegateOne: SaveNameDelegate?
    weak var delegateTwo: SaveSurnameDelegate?
    weak var delegateThree: SaveAgeDelegate?
    weak var delegateFour: SaveSexDelegate?
    weak var delegateFive: saveBirthdayDelegate?
    
    let textFieldtext: String
    
    init(delegateOne: SaveNameDelegate? = nil, delegateTwo: SaveSurnameDelegate? = nil, delegateThree: SaveAgeDelegate? = nil, delegateFour: SaveSexDelegate? = nil, delegateFive: saveBirthdayDelegate? = nil, textFieldtext: String) {
        self.delegateOne = delegateOne
        self.delegateTwo = delegateTwo
        self.delegateThree = delegateThree
        self.delegateFour = delegateFour
        self.delegateFive = delegateFive
        self.textFieldtext = textFieldtext
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(editLabel)
        view.addSubview(editField)
        view.addSubview(saveButton)

        editLabel.translatesAutoresizingMaskIntoConstraints = false
        editLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        editLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        editLabel.text = "Edit Info"
        editLabel.font = .systemFont(ofSize: 30)
        
        editField.translatesAutoresizingMaskIntoConstraints = false
        editField.topAnchor.constraint(equalTo: editLabel.bottomAnchor, constant: 50).isActive = true
        editField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        editField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        editField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        editField.leftViewMode = .always
        editField.leftView = UIView(frame: CGRect(x: 0,y: 0,width: 10,height: 0))
        editField.placeholder = textFieldtext
        editField.text = ""
        editField.layer.cornerRadius = 10
        editField.font = .systemFont(ofSize: 20)
        editField.backgroundColor = .systemGray5
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: editField.bottomAnchor, constant: 50).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 25
    }
    
    func saveAndReturnToProfile() {
        delegateOne?.didSaveNameInfo(name: editField.text ?? "")
        delegateTwo?.didSaveSurnameInfo(surname: editField.text ?? "")
        delegateThree?.didSaveAgeInfo(age: editField.text ?? "")
        delegateFour?.didSaveSexInfo(sex: editField.text ?? "" )
        delegateFive?.didSaveBirthdayInfo(date: editField.text ?? "")
        navigationController?.popViewController(animated: true)

    }
}



