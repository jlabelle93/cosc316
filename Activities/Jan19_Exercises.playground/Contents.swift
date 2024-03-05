import UIKit
//Exercise 1
func ReturnFirstAndLastName(name: String?) -> (first: String, last: String) {
    guard let temp = name, temp.count > 0 else {
        print("Name is nil or an empty string. Cannot process")
        return("", "")
    }
    
    let splitter = temp.split(separator: " ")
    return (splitter[0].description, splitter[1].description)
}

var student: String?
student = nil
print(ReturnFirstAndLastName(name: student))
print(ReturnFirstAndLastName(name: "John Doe"))
print()

// Exercise 2
var contactList: Dictionary = [String : String]()
contactList["John B"] = "604 767 6544"
contactList["John B"] = "604 767 6544"
contactList["John K"] = "250 865 6698"
contactList["Peter C"] = "250 876 5225"
contactList["Laura M"] = "250 764 5678"

contactList.updateValue("250 777 9999", forKey: "Jennifer W")

contactList.removeValue(forKey: "John K")

print("Contacts")
for (key, value) in contactList {
    print("Name: ", key, " tel.: ", value)
}
