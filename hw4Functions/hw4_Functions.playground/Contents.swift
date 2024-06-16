import UIKit

// Задание №1

func greeting() {
    print("Hello, world!")
}

func greetUser(name: String) {
    print("Hello, \(name)")
}

func greetReturn(name: String) -> String {
    return "Hello! \(name)"
}


// Задание №2

func stringSum(string1: String, string2: String) -> String {
    let sumString = string1 + string2
    return "Сумма количества символов введенных строк равна \(sumString.count) символов"
}


// Задание №3

func squareNumber(number: Int) {
    let number2 = number * number
    print ("Квадрат числа \(number) = \(number2)")
}

// Задание №4

func multiply(a: Double, b: Double) {
    print("\(a) * \(b) = \(a * b)")
}

func sum(a: Double, b: Double) {
    print("\(a) + \(b) = \(a + b)")
}

func division(a: Double, b: Double) {
    print("\(a) / \(b) = \(a / b)")
}

func subtraction(a: Double, b: Double) {
    print("\(a) - \(b) = \(a - b)")
}


// Задание №5

func square(r: Double) {
    print("Площадь круга равна \((r * r ) * 3.14) сантиметров")
}


// Задание №6

let isNight = false


func timeDescription(timeofday: Bool) -> String {
    if timeofday == true {
        return "Сейчас прекрасная ночь"
    } else {
        return "Cейчас солнечный день"
    }
}


// Задание № 7


func ifNumberISPrime(inputNumber: Int) -> Bool {
    guard inputNumber >= 2 && inputNumber <= 100 else { return false }
    
    for number in 2 ..< inputNumber {
        if inputNumber % number == 0 {
            return false
        }
    }
    return true
}


// Задание №8

func timeOfYear(monthNumber: Int) -> String {
    guard monthNumber <= 12 else {return "Введите месяц от 1 до 12"}
    switch monthNumber {
    case 3...5: return "Этот месяц принадлежит Весне"
    case 6...8: return "Этот месяц принадлежит Лету"
    case 9...11: return "Этот месяц принадлежит Осени"
    default: return "Этот месяц принадлежит Зиме"
    }
}


// Задание №9

func factorial(inputNumber: Int) -> Int {
    if inputNumber == 0 {
        return 1
    } else {
        return inputNumber * factorial(inputNumber: inputNumber - 1)
    }
}



// Задание 10

func fibonacci(inputNumber: Int) -> Int {
    if inputNumber == 0 {
        return 0
    } else if inputNumber == 1 {
        return 1
    } else {
        return fibonacci(inputNumber: inputNumber - 1) + fibonacci(inputNumber: inputNumber - 2)
    }
}


// Задание 11

func digitSum(number: inout Int) -> String {
    guard number > 999 && number < 10000 else { return "Введите корректное число"
    }
    var sumOfDigits = 0
    var list: [Int] = []
    while number > 0 {
        let digit = number % 10
        list.append(digit)
        number /= 10
    }
    for characters in list {
        sumOfDigits += characters
    }
    return ("Сумма цифр числа введенного числа = \(sumOfDigits)")
}

var nnn = 5515
digitSum(number: &nnn)





