import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = UITableView()
    lazy var languageArray = ["Swift", "C#", "JavaScript", "Python", "C++", "HTML", "SQL", "CSS", "Pascal", "Ruby"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        setTableViewConstraints()
        tableView.register(CustomCellOne.self, forCellReuseIdentifier: "CustomCellOne")
        tableView.register(CustomCellTwo.self, forCellReuseIdentifier: "CustomCellTwo")
    }
    
    func setTableViewDelegates() {
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints                                   = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive  = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive                = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive              = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive            = true
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 20
        case 1: return languageArray.count
        case 2: return 10 + languageArray.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellOne") as? CustomCellOne
            cell?.label.text = "Index row = \(indexPath.row)"
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellTwo") as? CustomCellTwo
            cell?.labelOne.text = "Programming language"
            cell?.labelTwo.text = languageArray[indexPath.row]
            return cell ?? UITableViewCell()
        case 2:
            if indexPath.row <= 9 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellTwo") as? CustomCellTwo
                cell?.labelOne.text = "Index row = \(indexPath.row)"
                cell?.labelTwo.text = "Section = \(indexPath.section)"
                return cell ?? UITableViewCell()
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellOne") as? CustomCellOne
                cell?.label.text = languageArray[indexPath.row - 10]
                return cell ?? UITableViewCell()
        }
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: "Task 1"
        case 1: "Task 2"
        case 2: "Task 3"
        default: ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
}
