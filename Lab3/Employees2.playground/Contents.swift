// Jacob Labelle 300306856
import UIKit

class Employee: CustomStringConvertible {
    var employeeName: String
    var employeeID: String
    var jobTitle: String
    var yearsOfService: Int
    var description: String {
        var desc: String = "Name: " + self.employeeName + "\nID: " + self.employeeID
        desc += "\nTitle: " + self.jobTitle + "\nYears of Service: " + String(yearsOfService)
        return desc
    }
    
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
}

class Volunteer: Employee {
    override var description: String {
        var desc: String = super.description
        desc += "\nReimbursement amount: " + String(format: "$%.2f", self.pay()) + "\nThank you for your volunteer work and time!"
        return desc
    }
}

var emp1 = Volunteer(name: "Peter Long", id: "112-22-3011", jobTitle: "Volunteer Worker", yearsOfService: 5)
print(emp1)
print("------------------------------------")

class SalaryEmployee: Employee {
    var annualSalary: Double
    override var description: String {
        var desc: String = super.description
        desc += "\nAnnual Salary: " + String(format: "$%.2f", self.annualSalary) + "\nPaycheck Amount: " + String(format: "$%.2f", self.pay())
        return desc
    }
    
    init(name: String, id: String, jobTitle: String, yearsOfService: Int, annualSalary: Double) {
        self.annualSalary = annualSalary
        super.init(name: name, id: id, jobTitle: jobTitle, yearsOfService: yearsOfService)
    }
    
    override func pay() -> Double {
        return annualSalary/26
    }
}
ﬁ
var emp2 = SalaryEmployee(name: "Martine Short", id: "116-23-6418", jobTitle: "Manager", yearsOfService: 8, annualSalary: 78600.00)
print(emp2)
print("------------------------------------")

class HourlyEmployee: Employee {
    var hourlyRate: Double
    var hoursWorked: Double
    override var description: String {
        var desc: String = super.description
        desc += "\nHourly Rate: " + String(format: "$%.2f", self.hourlyRate) + "\nHours Worked: " + String(format: "%.2f", self.hoursWorked)
        desc += "\nPaycheck Amount: " + String(format: "$%.2f", self.pay())
        return desc
    }
    
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
}

var emp3 = HourlyEmployee(name: "Susan Johnson", id: "123-32-3515", jobTitle: "Receptionist", yearsOfService: 10, hourlyRate: 16, hoursWorked: 84)
print(emp3)
print("------------------------------------")
var emp4 = HourlyEmployee(name: "Paul Simon", id: "133-53-4019", jobTitle: "System Support Analyst", yearsOfService: 4, hourlyRate: 22.0, hoursWorked: 75)
print(emp4)
print("------------------------------------")

class Executive: SalaryEmployee {
    var bonus: Double
    override var description: String {
        var desc: String = super.description
        desc += "\nBonus awarded: " + String(format: "$%.2f", self.bonus)
        return desc
    }
    
    override init(name: String, id: String, jobTitle: String, yearsOfService: Int, annualSalary: Double) {
        self.bonus = 0
        super.init(name: name, id: id, jobTitle: jobTitle, yearsOfService: yearsOfService, annualSalary: annualSalary)
    }
    
    override func pay() -> Double {
        return (self.annualSalary/26) + self.bonus
    }
}

var emp5 = Executive(name: "Steve Job", id: "111-22-3333", jobTitle: "CEO", yearsOfService: 25, annualSalary: 1000000.0)
print(emp5)
print("------------------------------------\n")
emp5.bonus = emp5.pay() * 0.03
print(emp5)
emp5.bonus = 0.0
print("------------------------------------")

emp5.bonus = emp5.pay() * 0.03
var employees: [Employee] = [emp1, emp2, emp3, emp4, emp5]
print("\nPrinting all Employees using an Array\n")
for i in employees {
    if(i is Executive) {
        print("3% bonus is to be awarded for current paycheck!")
    }
    print(i)
    print("------------------------------------\n")
}

var dict_employees = [String: Employee]()
for emp in employees {
    dict_employees.updateValue(emp, forKey: emp.employeeID)
}
print("\nPrinting all Employees using a Dictionary!\n")
for (_, value) in dict_employees {
    if(value is Executive) {
        print("3% bonus is to be awarded for current paycheck!")
    }
    print(value)
    print("------------------------------------\n")
}
