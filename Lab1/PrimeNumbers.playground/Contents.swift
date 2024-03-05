// Jacob Labelle 300306856
import UIKit

func printPrimeNumbers(num1:Int, num2:Int) {
    for i in num1...num2 {
        if(i == 1 || i == 0) {
            continue
        }
        var isPrime: Bool = true
        for j in 2..<i {
            if(i % j == 0) {
                isPrime = false
                break
            }
        }
        if(isPrime) {
            print(i, terminator: ", ")
        }
    }
}

func getPrimeNumbers(num1:Int, num2:Int) -> [Int] {
    var primeArray: [Int] = []
    for i in num1...num2 {
        if(i == 1 || i == 0) {
            continue
        }
        var isPrime: Bool = true
        for j in 2..<i {
            if(i % j == 0) {
                isPrime = false
                break
            }
        }
        if(isPrime) {
            primeArray.append(i)
        }
    }
    return primeArray
}

var primeNumbers: (Int, Int) -> [Int] = {
    var primeArray: [Int] = []
    for i in $0...$1 {
        if(i == 1 || i == 0) {
            continue
        }
        var isPrime: Bool = true
        for j in 2..<i {
            if(i % j == 0) {
                isPrime = false
                break
            }
        }
        if(isPrime) {
            primeArray.append(i)
        }
    }
    return primeArray
}

printPrimeNumbers(num1: 1, num2: 50)
print()
print(getPrimeNumbers(num1: 1, num2: 50))
print(primeNumbers(1,50))
