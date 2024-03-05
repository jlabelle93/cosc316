import UIKit
// define a structure
struct Person {
// define two properties with initial values
    var name: String = ""
    var age :Int = 0
}
// create instance of Person with a Memberwise initializer
var person1 = Person()
var person2 = Person (name: "Rob", age: 22)
// access properties and assign new values
person1.age = 21
person1.name = "Rick"
print("Name: \(person1.name) and Age: \( person1.age) ")
print("Name: \(person2.name) and Age: \( person2.age) ")
//----------------------------------------------------
struct Student {
// properties with no default values
   var name:  String
    var age: Int
    
}
// instance of Person with memberwise initializer
var student1 = Student(name: "Kyle", age: 19)
print("Name: \(student1.name) and Age: \(student1.age)")
//Try to override the memberwise initializer with init(...)

struct Weight {
    var kilograms: Float = 0.0
    var pounds: Float  {
      get {
           return kilograms * 2.205
      }
        set (newWeight) {
           kilograms = newWeight  / 2.205
        }
    }
}
var  myWeight = Weight()
myWeight.pounds = 184
print("kilos: \( myWeight.kilograms) and pounds: \( myWeight.pounds)")
myWeight.kilograms = 79.5
print("kilos: \( myWeight.kilograms) and pounds: \( myWeight.pounds)")

