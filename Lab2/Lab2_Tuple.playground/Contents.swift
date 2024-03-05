// Jacob Labelle 300306856
import UIKit

// Exercise 1

typealias Employee = (name: String, id: String, jobtitle: String, yearOfService: Int, annualsalary: Double)

var employees: [Employee] =
    [Employee(name:"Peter Long", id: "112-22-3011", jobtitle: "Volunteer Worker", yearOfService: 5, annualsalary: 1200.00),
     Employee(name:"Martine Short", id: "116-23-6418", jobtitle: "Manager", yearOfService: 8, annualsalary: 78600.00),
     Employee(name:"Susan Johnson", id: "123-32-3515", jobtitle: "Receptionist", yearOfService: 10, annualsalary: 38600.00),
     Employee(name:"Paul Simon", id: "133-53-4019", jobtitle: "System Support Analyst", yearOfService: 8, annualsalary: 65000.00)]

for emp in employees {
    print(emp.name, "\t", emp.id, "\t", emp.jobtitle)
}

func highestSalary(emps: [Employee]) -> (Employee) {
    var highestSalary: Double = 0
    var highestPaidEmployee: Employee = emps[0]
    
    for emp in emps {
        if(emp.annualsalary > highestSalary) {
            highestSalary = emp.annualsalary
            highestPaidEmployee = emp
        }
    }
    return highestPaidEmployee
}
print()
print("Highest paid employee: ", highestSalary(emps: employees))

// Exercise 2
var dict_employees = [String : Employee]()

for emp in employees {
    dict_employees.updateValue(emp, forKey: emp.id)
}

print()
for (key, value) in dict_employees {
    print(value.name, "\t", key, "\t", value.jobtitle)
}

func highestSalary(emps: [String: Employee]) -> (Employee) {
    var highestSalary: Double = 0
    var highestPaidEmployee: Employee = Employee(name:"", id: "", jobtitle: "", yearOfService: 0, annualsalary: 0)
    
    for (_, value) in emps {
        if(value.annualsalary > highestSalary) {
            highestSalary = value.annualsalary
            highestPaidEmployee = value
        }
    }
    return highestPaidEmployee
}
print()
print("Highest paid employee: ", highestSalary(emps: dict_employees))
