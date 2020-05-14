import UIKit

//LESSON 2

//task 1

extension Int {
    func isEven() -> Bool{
        return self % 2 == 0
    }
}

6.isEven()

//task 2

func isMultiple(value: Int, of divider: Int) -> Bool{
    return value % divider == 0
}

isMultiple(value: 9, of: 3)

var number = 3
number.isMultiple(of: 2)
number.isMultiple(of: 3)

//task 3

var arrayOfNumbers = Array(1...100)

//Task 4
arrayOfNumbers.removeAll { (element) -> Bool in
    return element.isMultiple(of: 2) || !element.isMultiple(of: 3)
}

arrayOfNumbers
arrayOfNumbers.last

//Task 5

func addNewFibanacciNumber(array: inout [Decimal]) {
    if array.count < 1 {
        array.append(0)
    } else if array.count < 2 {
        array.append(1)
    }else {
        array.append(array.last! + array[array.count - 2])
    }
}

var fibanacci:[Decimal] = []
for _ in 1...100
{
    addNewFibanacciNumber(array: &fibanacci)
}
fibanacci.last


//Task 6
var  primeNumbers = Array(2...541)

var index: Int = 0
while primeNumbers[index] != primeNumbers.last {
    let p = primeNumbers[index]
    primeNumbers.removeAll { (number) -> Bool in
        return number != p && number.isMultiple(of: p)
    }
    index += 1
}

primeNumbers
primeNumbers.last
primeNumbers.count

print(primeNumbers)
