//
//  FirstViewController.swift
//  TabbedApplication
//
//  Created by Jacob Labelle on 2024-02-18.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var view1DatePicker: UIDatePicker!
    @IBOutlet weak var view1Label: UILabel!
    @IBOutlet weak var view1Textfield: UITextField!
    
    /*
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .short
    formatter.locale = Locale(identifier: "en_US")
    
    let dateString = formatter.string(from: view1DatePicker.date)
    */
    
    // Hey, <name>! Your next appointment is on February 16, 2022 at 12:30 PM
    override func viewDidDisappear(_ animated: Bool) {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "en_US")
        let dateString: String = formatter.string(from: view1DatePicker.date)
        
        if let secondTab = self.tabBarController!.viewControllers![1] as? SecondViewController {
            secondTab.view2Label.text = "Hey, " + self.view1Textfield.text! + "! Your next appointment is on " + dateString
        }
    }
    
    @IBAction func textfieldDoneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let date = NSDate()
        view1DatePicker.setDate(date as Date, animated: false)
    }


}

