import UIKit

// Задание №1

enum Seasons {
    case spring
    case summer
    case autumn
    case winter
    case WrongSeason
}


// Задание №2

func whichSeason(monthNumber: Int) -> Seasons {
    guard monthNumber <= 12 && monthNumber > 0 else {return .WrongSeason}
    switch monthNumber {
    case 3...5: return .spring
    case 6...8: return .summer
    case 9...11: return .autumn
    default: return .winter
    }
}

// Задание №3


func stats(Strings: String?...) -> Int {
    var nilStrings = 0
    var newString = ""
    for word in Strings {
        if let word = word {
            newString += word
        } else {
            nilStrings += 1
        }
    }
    print(newString)
    return nilStrings
}

stats(Strings: nil, nil, "Artano", nil, "Lives", nil, nil)



