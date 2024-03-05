// Jacob Labelle 300306856
import UIKit

struct Employee {
    let name: String?
    let id: String?
    let jobtitle: String?
    let yearOfService: Int?
    let annualsalary: Double?
    
    init(name: String? = nil, id: String? = nil, title: String? = nil, year: Int? = nil, salary: Double? = nil) {
        self.name = name
        self.id = id
        jobtitle = title
        yearOfService = year
        annualsalary = salary
    }
}


// Exercise 1
var employees: [Employee] =
    [Employee(name:"Peter Long", id: "112-22-3011", title: "Volunteer Worker", year: 5, salary: 1200.00),
     Employee(name:"Martine Short", id: "116-23-6418", title: "Manager", year: 8, salary: 78600.00),
     Employee(name:"Susan Johnson", id: "123-32-3515", title: "Receptionist", year: 10, salary: 38600.00),
     Employee(name:"Paul Simon", id: "133-53-4019", title: "System Support Analyst", year: 8, salary: 65000.00)]

for emp in employees {
    // Unwrap safe or force unwrap?
    print(emp.name!, "\t", emp.id!, "\t", emp.jobtitle!)
}

func highestSalary(emps: [Employee]) -> (Employee) {
    var highestSalary: Double = 0
    var highestPaidEmployee: Employee = emps[0]
    
    for emp in emps {
        if(emp.annualsalary! > highestSalary) {
            highestSalary = emp.annualsalary!
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
    dict_employees.updateValue(emp, forKey: emp.id!)
}

print()
for (key, value) in dict_employees {
    print(value.name!, "\t", key, "\t", value.jobtitle!)
}

func highestSalary(emps: [String: Employee]) -> (Employee) {
    var highestSalary: Double = 0
    var highestPaidEmployee: Employee = Employee(name:"", id: "", title: "", year: 0, salary: 0)
    
    for (_, value) in emps {
        if(value.annualsalary! > highestSalary) {
            highestSalary = value.annualsalary!
            highestPaidEmployee = value
        }
    }
    return highestPaidEmployee
}
print()
print("Highest paid employee: ", highestSalary(emps: dict_employees))
