
import Foundation
import UIKit
import CoreData

struct PersonStruct {
    var name: String
    var surname: String
    var age: String
}

class CoreDataStorage {
    
    func addData(name: String, surname: String, age: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let person = Person(context: context)
        person.name = name
        person.surname = surname
        person.age = age
        
        do {
            try context.save()
        } catch {
            print("Vi obosralis'")
        }
    }
    
    func fetchData() -> [PersonStruct] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        guard let peopleData = try? context.fetch(fetchRequest) else { return [] }
        
        let structuredData = peopleData.map { person in
            PersonStruct(name: person.name ?? "Name is unknown",
                         surname: person.surname ?? "Surname is unknown",
                         age: person.age ?? "Age is unknown")
        }
        return structuredData
    }
    
}

