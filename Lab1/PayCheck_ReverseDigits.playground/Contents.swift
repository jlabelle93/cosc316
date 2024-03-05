// Jacob Labelle 300306856
import UIKit

func payCheck(_ name: String, _ hoursWorked: Double, _ hourlyRate: Double, _ bonus: Double? = 0) -> String {
    var stmt: String = name + ": ", pmt: String = "$"
    var OT: Double = 0, hours: Double = hoursWorked
    if(hoursWorked > 80) {
        OT = hoursWorked - 80
        hours = 80
    }
    var pay: Double = (hours * hourlyRate) + (OT * (hourlyRate * 1.5))
    if let bonus = bonus {
        pay = pay + bonus
    }
    pmt = pmt + String(format: "%.2f", pay)
    stmt = stmt + pmt
    return stmt
}

print(payCheck("John Doe", 70.5, 21.5, 150.0))
print(payCheck("Peter Chan", 88.5, 20.0))

func reverseDigits(_ num: Int, _ reversedStr: String) -> String {
    if(num == 0) {
        return reversedStr.isEmpty ? String(num) : reversedStr
    }
    var revString: String = num < 0 ? "-" + reversedStr : reversedStr
    var lastDigit: Int = abs(num) % 10
    revString = revString + String(lastDigit)
    var nextNum: Int = abs(num) / 10
    
    return reverseDigits(nextNum, revString)
}

print(reverseDigits(1234, ""))
print(reverseDigits(-1230, ""))
print(reverseDigits(0, ""))
