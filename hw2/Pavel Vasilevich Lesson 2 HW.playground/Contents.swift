import UIKit

// Задание 2

let myFirstGreeting: String = "Hello, user"                 // Тип String
var mySecondGreeting: String = "Hello, abuser"

let userIsPremium: Bool = true                              // Тип Bool
var userIsNotPremium: Bool = false

let myFirstNumber: Int = 10                                 // Тип Int
var mySecondNumber: Int = 20

let myThirdNumber: Double = 10.55                           // Тип Double
var myFourthNubmer: Double = 20.55

let myFifthNumber: Float = 100.55                           // Тип Float
var mySixthNumber: Float = 200.55

print(Int8.min, Int8.max)
print(Int16.min, Int16.max)
print(Int32.min, Int32.max)
print(Int.min, Int.max)       // Ограничен 64 разрядностью

print(UInt8.min, UInt8.max)
print(UInt16.min, UInt16.max)
print(UInt32.min, UInt32.max)
print(UInt64.min, UInt64.max) // Ограничен 64 разрядностью

print("Строка myFirstGreeting содержит \(myFirstGreeting.count) символов")

// Задание 3

let a1 = myFirstNumber + Int(myThirdNumber)
let a2 = Double(myFirstNumber)
let a3 = Float(myFirstNumber)
let a4 = String(mySecondNumber)
let a5 = Int(myThirdNumber) + Int(myFifthNumber)
let a6 = Float(myThirdNumber)
let a7 = String(userIsPremium) + String(userIsNotPremium)

let myNumberString = "12345"

let a8 = Int(myNumberString)

// Задание 4

var a = 1
var b = 2
var c = 3
var d = 4
var e = 5

print(a, "+", b, "=", a + b)
print(e, "-", c, "=", e - c)
print(b, "*", c, "=", b * c)
print(d, "/", b, "=", d / b)

// Задание 5

var isNight = false
if isNight == true{
    print("Сегодня ночь")
}else{
    print("Сегодня день")
}

// Задание 6

var myFirstString = "What a beautiful day outside"
var mySecondString = ""

for character in myFirstString {
mySecondString.append(character)
}

print(mySecondString)

// Задание 7

let alkash = [13,2,20,21,76]

for number in alkash {
    if number % 2 == 1 {
        print("Число \(number) - нечетное")
    }else{
        print("Число \(number) - четное")
    }
}

// Задание 8

var day = 15;

switch day {
case 0...10: print("Число \(day) попадает в 1 декаду месяца ")
case 11...20: print("Число \(day) попадает во 2 декаду месяца ")
default: print("Число \(day) попадает в 3 декаду месяца ")
}


// Задание 9

var myThirdString = "yadebil"
if myThirdString.first == "y" {
    print("Да")
}else{
    print("Нет")
}

// Задание 10

var list1 = 1...10
var list2 = 1...10

for number1 in list1 {
    for number2 in list2{
        print(number1,"*", number2, "=",(number1 * number2))
    }
}




