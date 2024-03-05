//
//  FindViewController.swift
//  CollegeTableViewDB
//
//  Created by Jacob Labelle on 2024-03-03.
//

import UIKit

class FindViewController: UIViewController {
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

    @IBAction func findStudent(_ sender: Any) {
        let collegeDB = FMDatabase(path: dbPath as String)
        if (collegeDB.open()) {
            let querySQL = "SELECT NAME, PROGRAM, GRADE_AVERAGE FROM STUDENTS WHERE id = '\(id.text!)'"
            let results:FMResultSet? = collegeDB.executeQuery(querySQL, withArgumentsIn: [])
            if results?.next() == true {
                name.text = results?.string(forColumn: "NAME")
                program.text = results?.string(forColumn: "PROGRAM")
                grade.text = results?.string(forColumn: "GRADE_AVERAGE")
                status.text = "Record Found."
            } else {
                status.text = "Record not found."
                name.text = ""
                program.text = ""
                grade.text = ""
            }
            collegeDB.close() }
        else {
            print("Error: \(collegeDB.lastErrorMessage())")
        }
    }
    
}
