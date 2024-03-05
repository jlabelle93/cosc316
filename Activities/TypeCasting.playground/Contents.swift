//: Playground - noun: a place where people can play
import UIKit
//  Casting ensures that the value is a particular type
var someArray = [AnyObject]() //this array could contain any type of object
someArray.append("CartoonSmart.com" as AnyObject) //adding a string to the array
//test to see if the first object in the array is actually string
if let greatTutorialSite:String = someArray[0] as? String {
    //Casting success, the value in the array is a string
    print ( "  \(greatTutorialSite) is a great video tutorial site")
}
// or
if someArray[0] is String {
    print ( "  \(someArray[0] as! String) is a great great video tutorial site")
}
//---------------------------------------------------------------------------------------
let controlArray = [UILabel(), UITextView(), UIButton()]
//using the "is" Operator for checking one of all possible types for downcasting
for item in controlArray {
    if item is UILabel {
        print("UILabel")
    }
    else if item is UITextView {
        print("UITextView")
    }
    else if item is UIButton {
        print("UIButton")
    }
    else if item is UIDatePicker {
        print("UIDatePicker")
    }
}
//using the "as?" operator for checking optional type for downcasting
let controlArray1 = [UILabel(), UIButton(), UIDatePicker()]
for item in controlArray1 {
    if let someLabel = item as? UILabel {
        someLabel.text = "Hello, class!"
        print (someLabel.text!)
    }
    else if let someDatePicker = item as? UIDatePicker {
        print (someDatePicker.date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "YYYY-MM-DD HH:mm:ss"
        
        let date = dateFormatter.date(from:"2020-01-01 08:30:00")
        
        someDatePicker.date = date!
        print (someDatePicker.date)
    }
  }
//direct downcasting if knowing that it is possible
var aControlThatShouldBeAButton: UIView = UIButton()
var thatButton: UIButton = aControlThatShouldBeAButton as! UIButton
