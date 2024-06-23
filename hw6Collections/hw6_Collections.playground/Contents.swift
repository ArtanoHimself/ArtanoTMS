import UIKit

// Задание №1

let array1 = Array(0...14)
let array2 = Array(14...30)
let array3 = array1 + array2


// Задание №2

func square(customArray: [Int]) -> [Int] {
    return customArray.map {$0 * $0}
}


// Задание № 3

func filter(customArray: [Int]) -> [Int] {
    return customArray.filter { $0 % 2 == 0 }
}


// Написать 3 примера с использованием .map

let myFirstArray = Array(0...10)


let mySecondArray = myFirstArray.map {$0 + 5}               // 1 пример - новый измененный массив

let myThirdArray = mySecondArray.map {$0 + $0}              // 2 пример - чейн

let myFourthArray = myThirdArray.map {String($0)}           // 3 пример - конверт Int в String


// Написать 2 примера с использованием .filter

func filterLessThanThree(customArray: [Int]) -> [Int] {     // 1 пример - функция принимает массив и возвращает отфильтрованный массив, где фильтруются значения меньше 3
    return customArray.filter {$0 > 3}
}


let listOfNames = ["Baltika", "FlyingPudge", "Alkash", "Pivko", "Tankist", "Doter"]     // 2 пример фильтрует значения в массиве в которых значения символов меньше 5

let papasha = listOfNames.filter {$0.count > 5}


// Написать 2 примера с использованием .compactMap

let optArray: [Int?] = [1, 5, 6, nil, 2, nil, 3, nil]         // 1 пример фильтрует все значения nil

let nonOptArray = optArray.compactMap { $0 }


let optStringArray: [String?] = ["Pudge", nil, "Pos6", "6", "Feed", "2", nil]

let intArray = optStringArray.compactMap {Int($0 ?? "$0")}    // 2 пример конвериирует возможные значения String в Int фильтруя значения nil



// Написать 2 примера с использованием sort

var anotherListOfNames: [String] = ["Pavel", "Artano", "Pudge", "Butcher", "Nikita"]     // 1 пример сортирует значения в массиве в алфавитном порядке и апдейтит этот самый массив.

anotherListOfNames.sort()

var randomNumbers: [Int] = [52, 123, 654, 42, 612, 757, 1, 6, 9, 4, 15]    // 2 пример сортирует значения в убыювающем порядке и апдейтит массив randomNumbers

randomNumbers.sort(by: >)


// Написать 2 примера с использованием sorted

let anotherListOfNames1: [String] = ["Pavel", "Artano", "Pudge", "Butcher", "Nikita"]     // 1 пример показывает как ".sorted" берет массив "anotherListOfNames1" и, сортируя значения внутри в обратном алфавитном порядке, создает новую константу

let filteredListOfNames = anotherListOfNames1.sorted(by: >)

let filteredListifnames2 = anotherListOfNames1.sorted {$0.count < $1.count}               // 2 пример показывает как ".sorted" берет массив "anotherListOfNames1" и, сортируя значения таким образом, чтобы сначала были элементы с наименьшим количеством символов, создает новую константу


// Различие между .sort и .sorted в том, что при использовании второй нам нужно создавать новое значение, в то время как .sort апдейтит уже существующий массив.
























