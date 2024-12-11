
import Foundation

enum Operation: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

func generateRandomNumber100() -> Int {
    return Int.random(in: 0...100)
}

func generateRandomNumber10() -> Int {
    return Int.random(in: 0...10)
}

func generateRandomOperation() -> Operation {
    let operations: [Operation] = [.addition, .subtraction, .multiplication, .division]
    return operations.randomElement() ?? Operation.addition
}

func generateMathematicalOperation() -> (String, Int) {
    let num1 = generateRandomNumber100()
    let num2 = generateRandomNumber100()
    let num3 = generateRandomNumber10()
    let operation = generateRandomOperation()
    
    var example: String
    var answer: Int
    
    switch operation {
    case .addition:
        example = "\(num1) + \(num2) = ?"
        answer = num1 + num2
    case .subtraction:
        example = "\(num1) - \(num2) = ?"
        answer = num1 - num2
    case .multiplication:
        example = "\(num1) * \(num3) = ?"
        answer = num1 * num3
    case .division:
        if num2 == 0 {
            return generateMathematicalOperation()
        }
        let validNum1 = num2 * (generateRandomNumber100() % 10 + 1)
        example = "\(validNum1) / \(num2) = ?"
        answer = validNum1 / num2
    }
    return (example, answer)
}

