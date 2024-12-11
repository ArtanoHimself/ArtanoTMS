
import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    
    lazy var coordinatesLabel: UILabel = {
        let label = UILabel()
        label.text = "fool"
        return label
    }()
    
    lazy var coordinatesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get your coordinates", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        
        setConstraints()
        componentsSetup()
        requestLocationPermission()
        trackCurrentLocation()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func componentsSetup() {
        stackView.addArrangedSubview(coordinatesLabel)
        stackView.addArrangedSubview(coordinatesButton)
        
        coordinatesButton.addTarget(self, action: #selector(updateCoordinatesLabel), for: .touchUpInside)
    }
    
    func requestLocationPermission() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
    }
    
    func trackCurrentLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    @objc func updateCoordinatesLabel() {
        guard let currentLocation = locationManager.location else { return }
        coordinatesLabel.text = "Lattitude = \(Int(currentLocation.coordinate.latitude)), Longtitude = \(Int(currentLocation.coordinate.longitude))"
    }
}


