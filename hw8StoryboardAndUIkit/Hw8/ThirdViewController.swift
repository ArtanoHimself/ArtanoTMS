//
//  ThirdViewController.swift
//  Hw8
//
//  Created by Artano on 6.07.24.
//

import UIKit
import SnapKit


// Очень хотел заодно сделать слайдер как в начале 11 урока. Но сейчас 4 утра💀... И я все равно его сделал. Слайдер двигается🥳

class ThirdViewController: UIViewController {
    
    lazy var welcomeLabel: UILabel = UILabel()
    lazy var controlLabel: UILabel = UILabel()
    lazy var emojiLabel: UILabel = UILabel()
    lazy var lightSegmented: UISegmentedControl = UISegmentedControl(items: ["On", "Off"])
    lazy var lightsLabel: UILabel = UILabel()
    lazy var doorSegmented: UISegmentedControl = UISegmentedControl(items: ["Lock", "Unlock"])
    lazy var doorLabel: UILabel = UILabel()
    lazy var acSegmented: UISegmentedControl = UISegmentedControl(items: ["Auto","On", "Off"])
    lazy var acLabel: UILabel = UILabel()
    lazy var temperatureLabel: UILabel = UILabel()
    lazy var temperatureSlider: UISlider = UISlider(frame: .zero, primaryAction: .init(handler: { _ in
        self.sliderInfo()
    }))
    lazy var temperatureLabelInfo: UILabel = UILabel()
    lazy var celciusLabel: UILabel = UILabel()
    lazy var alarmButton: UIButton = UIButton()
    
    func sliderInfo() {
        temperatureLabelInfo.text = String(Int(temperatureSlider.value))
    }
    

    override func viewDidLoad() {
        
        

        super.viewDidLoad()
        
        
        
        
        
        addSubviews(welcomeLabel, controlLabel, lightSegmented, lightsLabel, doorSegmented, doorLabel, acSegmented, acLabel, temperatureLabel, temperatureSlider, temperatureLabelInfo, celciusLabel, alarmButton, emojiLabel)
        
        welcomeLabel.text = "Welcome, Artano"
        welcomeLabel.font = .systemFont(ofSize: 30)
        welcomeLabel.textColor = .white
        welcomeLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
        }
        
        controlLabel.text = "Appartment control page"
        controlLabel.font = .systemFont(ofSize: 25)
        controlLabel.textColor = .white
        controlLabel.snp.makeConstraints {
            $0.leading.equalTo(welcomeLabel)
            $0.top.equalTo(welcomeLabel).offset(60)
        }
        
        emojiLabel.text = "🏠"
        emojiLabel.snp.makeConstraints{
            $0.leading.equalTo(controlLabel)
            $0.top.equalTo(controlLabel).offset(30)
        }
        
        lightSegmented.selectedSegmentIndex = 1
        lightSegmented.snp.makeConstraints{
            $0.leading.equalTo(welcomeLabel)
            $0.top.equalTo(welcomeLabel).offset(200)
            $0.width.equalTo(200)
        }
        
        lightsLabel.text = "Lights"
        lightsLabel.font = .systemFont(ofSize: 15)
        lightsLabel.textColor = .white
        lightsLabel.snp.makeConstraints{
            $0.leading.equalTo(lightSegmented)
            $0.top.equalTo(lightSegmented).offset(-30)
        }
        
        doorSegmented.selectedSegmentIndex = 1
        doorSegmented.snp.makeConstraints{
            $0.leading.equalTo(lightSegmented)
            $0.top.equalTo(lightSegmented).offset(80)
            $0.width.equalTo(200)
        }
        
        doorLabel.text = "Door"
        doorLabel.font = .systemFont(ofSize: 15)
        doorLabel.textColor = .white
        doorLabel.snp.makeConstraints{
            $0.leading.equalTo(doorSegmented)
            $0.top.equalTo(doorSegmented).offset(-30)
        }
        
        acSegmented.selectedSegmentIndex = 2
        acSegmented.snp.makeConstraints{
            $0.leading.equalTo(doorSegmented)
            $0.top.equalTo(doorSegmented).offset(80)
            $0.width.equalTo(200)
        }
        
        acLabel.text = "A/C"
        acLabel.font = .systemFont(ofSize: 15)
        acLabel.textColor = .white
        acLabel.snp.makeConstraints{
            $0.leading.equalTo(acSegmented)
            $0.top.equalTo(acSegmented).offset(-30)
        }
        
        temperatureSlider.minimumValue = -50
        temperatureSlider.maximumValue = 100
        temperatureSlider.setValue(21, animated: true)
        temperatureSlider.snp.makeConstraints{
            $0.leading.equalTo(acSegmented)
            $0.top.equalTo(acSegmented).offset(80)
            $0.width.equalTo(200)
        }
        
        temperatureLabel.text = "Temperature"
        temperatureLabel.font = .systemFont(ofSize: 15)
        temperatureLabel.textColor = .white
        
        temperatureLabel.snp.makeConstraints{
            $0.leading.equalTo(temperatureSlider)
            $0.top.equalTo(temperatureSlider).offset(-30)
            
        }
        
        temperatureLabelInfo.text = String(Int(temperatureSlider.value))
        temperatureLabelInfo.textColor = .white
        temperatureLabelInfo.font = .systemFont(ofSize: 20)
        temperatureLabelInfo.snp.makeConstraints{
            $0.left.equalTo(temperatureSlider.snp.right).offset(10)
            $0.top.equalTo(temperatureSlider).offset(2)
        }
        
        celciusLabel.text = "°C"
        celciusLabel.textColor = .white
        celciusLabel.snp.makeConstraints{
            $0.left.equalTo(temperatureLabelInfo).offset(33)
            $0.top.equalTo(temperatureLabelInfo)
        }
        
        alarmButton.setTitle("Alarm", for: .normal)
        alarmButton.setTitleColor(.red, for: .normal)
        alarmButton.setTitleColor(.gray, for: .highlighted)
        alarmButton.backgroundColor = .white
        alarmButton.snp.makeConstraints{
            $0.leading.equalTo(temperatureLabel)
            $0.top.equalTo(temperatureSlider).offset(150)
            $0.width.equalTo(80)
        }
     
        

    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach{
            view.addSubview($0)
        }
    }
    
    
    
    
    
    
    
    

}
