import UIKit


struct Adress {
    let x: Double
    let y: Double
    let streetName: String
}


class Person {
    let name: String
    let surname: String
    let age: Int
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
}


final class Director: Person {
    let experience: String
    let rating: Int
    
    init(experience: String,
         rating: Int,
         name: String,
         surname: String,
         age: Int) {
        self.experience = experience
        self.rating = rating
        super.init(name: name,
                   surname: surname,
                   age: age)
    }
}


enum Subject: String {
    case farming = "Farming"
    case jungling = "Jungling"
    case laning = "Laning"
    case communication = "Communication"
}


final class Student: Person {
    let gradeNumber: Int
    let studentResults: [(Subject, Int)]
    
    init(gradeNumber: Int?,
         studentResults: [(Subject, Int)],
         name: String,
         surname: String,
         age: Int?) {
        self.gradeNumber = 1
        self.studentResults = studentResults
        super.init(name: name,
                   surname: surname,
                   age: 6)
    }
    func studentInfo() {
        print(self.surname, self.name,"(\(self.gradeNumber)st grade)")
        for element in studentResults {
            print(element.0.rawValue, "- \(element.1)")
        }
    }
        
}

struct School {
    let students: [Student]
    let director: Director
    let adress: Adress
    let schoolName = "Not your average School"
    
    init(students: Student, director: Director, adress: Adress) {
        self.students = [students]
        self.director = director
        self.adress = adress
    }
    func schoolInfo() {
        print("Welcome to the \(schoolName)")
        print("Our school is located at \(adress.streetName)")
        print("Our school director is \(director.name) \(director.surname). He is \(director.age) years old , and he has \(director.rating) behaviour score, with \(director.experience) of experience")
        print("Our students are \(student1.name) \(student1.surname), \(student2.name) \(student2.surname), \(student3.name) \(student3.surname)")
    }
}

let schoolAdress: Adress = .init(x: 25.51, y: 52.15, streetName: "Baker's street 5")
let director: Director = .init(experience: "15 years", rating: 12000, name: "Pudger", surname: "Hookovich", age: 54)
let student1: Student = .init(gradeNumber: 3, studentResults: [(.farming, 5), (.laning, 2),(.jungling, 5),(.communication, 1)], name: "Shadow", surname: "Fiendovich", age: 8)
let student2: Student = .init(gradeNumber: 8, studentResults: [(.farming, 2), (.laning, 5),(.jungling, 3),(.communication, 4)], name: "Huskar", surname: "Spearovich", age: 13)
let student3: Student = .init(gradeNumber: 10, studentResults: [(.farming, 4), (.laning, 4),(.jungling, 3),(.communication, 5)], name: "Ember", surname: "Flamovich", age: 15)


let school: School = .init(students: student1, director: director, adress: schoolAdress)

school.schoolInfo()
student1.studentInfo()

















 
 
 
 

