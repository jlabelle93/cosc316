import UIKit

let number1 = 0.123456789
let formatter = NumberFormatter()
formatter.maximumFractionDigits = 4
formatter.roundingMode = .down   //always round down
//let string1: String = formatter.string(from: NSNumber(value: number1))!
// or
let string1: String = formatter.string(from: number1 as NSNumber)!
print (string1)

let number2 = 0.123456789
formatter.maximumFractionDigits = 3
formatter.minimumIntegerDigits = 1  //1 or 0
formatter.roundingMode = .halfUp    //halfUp <==> halfDown

let string2: String = formatter.string(from: NSNumber(value: number2))!

print (string2)

let number3 = 23456789.877867
formatter.numberStyle = .currency
formatter.maximumFractionDigits = 2
let string3: String = formatter.string(from: NSNumber(value: number3))!
let string4: String = formatter.string(from: number3 as NSNumber)!
print (string3)
print (string4)
