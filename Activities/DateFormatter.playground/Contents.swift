import UIKit

let today = Date()
let formatter1 = DateFormatter()
formatter1.dateStyle = .short
print(formatter1.string(from: today))


let formatter2 = DateFormatter()
formatter2.timeStyle = .medium
print(formatter2.string(from: today))


let formatter3 = DateFormatter()
formatter3.dateFormat = "HH:mm:ss a E MMM d, y"    //“HH:mm a:E M/d/y”
print(formatter3.string(from: today))
