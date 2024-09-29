
import UIKit

protocol SaveButtonDelegate: AnyObject {
    func saveChanges(name: String)
}

class PickerController: UIViewController {
    
    lazy var cityPicker = UIPickerView()
    lazy var saveButton = CustomButton(buttonTitle: "Save")
    
    weak var delegate: SaveButtonDelegate?
    
    let citiesList = ["Alberta", "British Collumbia", "Manitoba", "New Brunswick", "Nova Scotia", " Ontario", "Quebec", "Saskatchewan", "Northwest Territories", "Nunavut", "Yukon"]
    var saveName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(cityPicker)
        view.backgroundColor  = .systemBackground
        cityPicker.delegate   = self
        cityPicker.dataSource = self
        cityPicker.translatesAutoresizingMaskIntoConstraints                      = false
        cityPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
   
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints                       = false
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive  = true
        saveButton.topAnchor.constraint(equalTo: cityPicker.bottomAnchor).isActive = true
        saveButton.addTarget(self, action: #selector(saveAndDismiss), for: .touchUpInside)
    }
    
    @objc func saveAndDismiss () {
        delegate?.saveChanges(name: saveName)
        self.dismiss(animated: true)
    }

}

extension PickerController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        citiesList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        citiesList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        saveName = citiesList[row]
    }

}
