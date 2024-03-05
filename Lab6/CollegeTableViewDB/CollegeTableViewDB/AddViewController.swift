//
//  AddViewController.swift
//  CollegeTableViewDB
//
//  Created by Jacob Labelle on 2024-03-03.
//

import UIKit

class AddViewController: UIViewController {
    var dbPath = String()
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var program: UITextField!
    @IBOutlet weak var grade: UITextField!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addStudent(_ sender: Any) {
        let collegeDB = FMDatabase(path: dbPath as String)
        if (collegeDB.open()) {
            let insertSQL = "INSERT INTO STUDENTS(ID, NAME, PROGRAM, GRADE_AVERAGE) VALUES('\(id.text!)', '\(name.text!)', '\(program.text!)', '\(grade.text!)')"
            
            let result = collegeDB.executeUpdate(insertSQL, withArgumentsIn: [])
            
            if (!result) {
                status.text = "Failed to add student."
                print("Error: \(collegeDB.lastErrorMessage())")
            } else {
                status.text = "Student added."
                name.text = ""
                id.text = ""
                program.text = ""
                grade.text = ""
            }
        } else {
            print("Error: \(collegeDB.lastErrorMessage())")
        }
    }
    
}

