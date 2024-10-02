
import UIKit

protocol SaveButtonDelegate: AnyObject {
    func saveChanges(UTC: Int)
}

class TimeChangeViewController: UIViewController {
    
    lazy var cityPicker = UIPickerView()
    lazy var confirmButton = CustomButton(name: "Confirm")
    var cityUTC = ""
    weak var delegate: SaveButtonDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(cityPicker)
        view.addSubview(confirmButton)
        cityPicker.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        cityPicker.delegate = self
        cityPicker.dataSource = self
        confirmButton.addTarget(self, action: #selector(saveAndDismiss), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cityPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.topAnchor.constraint(equalTo: cityPicker.bottomAnchor)
        ])
    }
    
    @objc func saveAndDismiss() {
        delegate?.saveChanges(UTC: Int(cityUTC) ?? 0)
        self.dismiss(animated: true)
    }
}

extension TimeChangeViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityList[row].name + " \(cityList[row].timeZone) UTC"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityUTC = "\(cityList[row].timeZone)"
    }
    
    
}
