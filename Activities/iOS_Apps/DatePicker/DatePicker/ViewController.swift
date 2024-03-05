//
//  ViewController.swift
//  DatePicker
//
//  Created by Student on 2024-02-13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateDisplayView: UITextField!
    
    @IBAction func getDateTime(_ sender: Any) {
           
           let date = datePicker.date
           
           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .medium
           dateFormatter.timeStyle = .short
           
           dateFormatter.locale = Locale(identifier: "en_US")
           dateDisplayView.text = "Date & Time selected:\n" + dateFormatter.string(from: date)
           
           let components = datePicker.calendar.dateComponents([.day, .month, .year, .hour, .minute], from: datePicker.date)
           let day = components.day!
           let month = components.month!
           let year = components.year!
           let hour = components.hour!
           let minute = components.minute!
           dateDisplayView.text! += "\nDate created from Components: \(year)/\(month)/\(day) -  \(hour):\(minute)"

       }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let date = NSDate()
        datePicker.setDate(date as Date, animated: false)
        dateDisplayView.text = "Current Date and Greenwich Mean Time : \(date)"
        
        
    }

}

