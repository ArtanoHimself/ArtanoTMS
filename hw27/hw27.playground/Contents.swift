import UIKit

class BankAccount {
    
    var accountBalance = 0
    
    func deposit(value: Int) {
        accountBalance = accountBalance + value
    }
    
    func withdraw(value: Int) {
        accountBalance = accountBalance - value
    }
}

let alphaBankAccount = BankAccount()
let semaphore = DispatchSemaphore(value: 1)
let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)

concurrentQueue.async {
    for i in 1...10000 {
        semaphore.wait()
        alphaBankAccount.deposit(value: 10)
        alphaBankAccount.deposit(value: 1)
        alphaBankAccount.deposit(value: 30)
        print(alphaBankAccount.accountBalance)
        semaphore.signal()
    }
}

concurrentQueue.async {
    for i in 1...10000 {
        semaphore.wait()
        alphaBankAccount.withdraw(value: 5)
        alphaBankAccount.withdraw(value: 3)
        alphaBankAccount.withdraw(value: 2)
        print(alphaBankAccount.accountBalance)
        semaphore.signal()
    }
}

/* Добавил принты для отслеживания корректного изменения счета
 Withdraw = -100000
 Deposit  =  410000
 */
