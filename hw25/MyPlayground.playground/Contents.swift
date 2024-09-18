import UIKit

class Person {
    let name: String
    let age: Int
    var apartment: Apartment?
    
    init(name: String, age: Int, apartment: Apartment? = nil) {
        self.name = name
        self.age = age
        self.apartment = apartment
        print("\(name) is inited")
    }
    deinit {
        print("\(name) is deinited")
    }
}

class Apartment {
    let adress: String
    weak var owner: Person? /*Если убрать значение "weak", то деинита не будет даже если освободить значения при помощи "nil"*/
    
    init(adress: String, owner: Person? = nil) {
        self.adress = adress
        self.owner = owner
        print("\(adress) is inited")
    }
    
    deinit {
        print("\(adress) is deinited")
    }
}

var someone: Person? = Person(name: "Jora", age: 54)
var house: Apartment? = Apartment(adress: "Parkovaya")

house?.owner = someone      /*Создается зависимость друг от друга*/
someone?.apartment = house

someone = nil
house = nil



