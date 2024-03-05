import UIKit

// Dictionary is a value type in Swift  (Array and String are value types in Swift too)
//create the Swift Dictionary with nothing, and set the types
// (String will be Key, and any object will be the value
var someDict = [String : Any]()  //could use Any or AnyObject here
// note: AnyObject is an instance of Any classes, while Any is an instance of Any classes and others
// like  struct, enum, etc.

// add a key and value
someDict["Ex wives"] = 2 as Any
print (someDict)
// Exercise:
//declare  var names: [String] = ["Kathy", "Jennifer"]
// Then assign names to be the value associated with the key "Ex wives"
var names: [String] = ["Kathy", "Jennifer"]
someDict["Ex wives"] = names
// add another key and value
someDict["Current wives"] = 1 as AnyObject
print (someDict)
var anotherDict = someDict
anotherDict["Current wives"] = 0 as Any
// Exercise:
// add “Laura” into names array
//then use anotherDict.updatevalues (names, “Ex wives) to update anotherDict
names.append("Laura")
anotherDict.updateValue(names, forKey:"Ex wives")

print ("someDict:",someDict)
print ("anotherDict:",anotherDict)
//remove Current wives. Oh well.
someDict.removeValue(forKey: "Current wives")
print (someDict)
//changes ex wives to 6
someDict["Ex wives"] = 3 as AnyObject
print (someDict)
// remove all
someDict.removeAll()
