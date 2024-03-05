// Jacob Labelle 300306856
import UIKit

class Employee {
    var employeeName: String
    var employeeID: String
    var jobTitle: String
    var yearsOfService: Int
    
    init(name: String, id: String, jobTitle: String, yearsOfService: Int) {
        self.employeeName = name
        self.employeeID = id
        self.jobTitle = jobTitle
        self.yearsOfService = yearsOfService
    }
    
    func pay() -> Double {
        var pay: Double = 100.00
        return pay
    }
    
    func toString() -> String {
        var printout: String = "Name: " + self.employeeName + "\nID: " + self.employeeID
        printout += "\nTitle: " + self.jobTitle + "\nYears of Service: " + String(yearsOfService)
        return printout
    }
}

class Volunteer: Employee {
    
    override func toString() -> String {
        var printout: String = "Name: " + self.employeeName + "\nID: " + self.employeeID
        printout += "\nTitle: " + self.jobTitle + "\nYears of Service: " + String(yearsOfService)
        printout += "\nReimbursement amount: " + String(format: "$%.2f", self.pay()) + "\nThank you for your volunteer work and time!"
        return printout
    }
}

var emp1 = Volunteer(name: "Peter Long", id: "112-22-3011", jobTitle: "Volunteer Worker", yearsOfService: 5)
print(emp1.toString())
print("------------------------------------")

class SalaryEmployee: Employee {
    var annualSalary: Double
    
    init(name: String, id: String, jobTitle: String, yearsOfService: Int, annualSalary: Double) {
        self.annualSalary = annualSalary
        super.init(name: name, id: id, jobTitle: jobTitle, yearsOfService: yearsOfService)
    }
    
    override func pay() -> Double {
        return annualSalary/26
    }
    
    override func toString() -> String {
        var printout: String = "Name: " + self.employeeName + "\nID: " + self.employeeID
        printout += "\nTitle: " + self.jobTitle + "\nYears of Service: " + String(yearsOfService)
        printout += "\nAnnual Salary: " + String(format: "$%.2f", self.annualSalary) + "\nPaycheck Amount: " + String(format: "$%.2f", self.pay())
        return printout
    }
}

var emp2 = SalaryEmployee(name: "Martine Short", id: "116-23-6418", jobTitle: "Manager", yearsOfService: 8, annualSalary: 78600.00)
print(emp2.toString())
print("------------------------------------")

class HourlyEmployee: Employee {
    var hourlyRate: Double
    var hoursWorked: Double
    
    init(name: String, id: String, jobTitle: String, yearsOfService: Int, hourlyRate: Double, hoursWorked: Double) {
        self.hourlyRate = hourlyRate
        self.hoursWorked = hoursWorked
        super.init(name: name, id: id, jobTitle: jobTitle, yearsOfService: yearsOfService)
    }
    
    override func pay() -> Double {
        if(self.hoursWorked > 80) {
            return ((self.hoursWorked - 80) * (self.hourlyRate * 1.5)) + (80 * self.hourlyRate)
        } else {
            return (self.hourlyRate * self.hoursWorked)
        }
    }
    
    override func toString() -> String {
        var printout: String = "Name: " + self.employeeName + "\nID: " + self.employeeID
        printout += "\nTitle: " + self.jobTitle + "\nYears of Service: " + String(yearsOfService)
        printout += "\nHourly Rate: " + String(format: "$%.2f", self.hourlyRate) + "\nHours Worked: " + String(format: "%.2f", self.hoursWorked)
        printout += "\nPaycheck Amount: " + String(format: "$%.2f", self.pay())
        return printout
    }
}

var emp3 = HourlyEmployee(name: "Susan Johnson", id: "123-32-3515", jobTitle: "Receptionist", yearsOfService: 10, hourlyRate: 16, hoursWorked: 84)
print(emp3.toString())
print("------------------------------------")
var emp4 = HourlyEmployee(name: "Paul Simon", id: "133-53-4019", jobTitle: "System Support Analyst", yearsOfService: 4, hourlyRate: 22.0, hoursWorked: 75)
print(emp4.toString())
print("------------------------------------")

class Executive: SalaryEmployee {
    var bonus: Double
    
    override init(name: String, id: String, jobTitle: String, yearsOfService: Int, annualSalary: Double) {
        self.bonus = 0
        super.init(name: name, id: id, jobTitle: jobTitle, yearsOfService: yearsOfService, annualSalary: annualSalary)
    }
    
    override func pay() -> Double {
        return (self.annualSalary/26) + self.bonus
    }
    
    override func toString() -> String {
        return super.toString() + "\nBonus awarded: " + String(format: "$%.2f", self.bonus)
    }
}

var emp5 = Executive(name: "Steve Job", id: "111-22-3333", jobTitle: "CEO", yearsOfService: 25, annualSalary: 1000000.0)
print(emp5.toString())
print("------------------------------------\n")
emp5.bonus = emp5.pay() * 0.03
print(emp5.toString())
emp5.bonus = 0.0
print("------------------------------------")

emp5.bonus = emp5.pay() * 0.03
var employees: [Employee] = [emp1, emp2, emp3, emp4, emp5]
print("\nPrinting all Employees using an Array\n")
for i in employees {
    if(i is Executive) {
        print("3% bonus is to be awarded for current paycheck!")
    }
    print(i.toString())
    print("------------------------------------\n")
}

var dict_employees = [String: Employee]()
for emp in employees {
    dict_employees.updateValue(emp, forKey: emp.employeeID)
}
print("\nPrinting all Employees using a Dictionary!\n")
for (_, value) in dict_employees {
    if( value is Executive) {
        print("3% bonus is to be awarded for current paycheck!")
    }
    print(value.toString())
    print("------------------------------------\n")
}
