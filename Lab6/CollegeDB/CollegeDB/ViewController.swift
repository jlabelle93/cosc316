//
//  ViewController.swift
//  CollegeDB
//
//  Created by Jacob Labelle on 2024-03-02.
//

import UIKit

class ViewController: UIViewController {
    var databasePath = String()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var programField: UITextField!
    @IBOutlet weak var gradeField: UITextField!
    @IBOutlet weak var statusField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("okcollege").path
        
        if !filemgr.fileExists(atPath: databasePath as String) {
            let collegeDB = FMDatabase(path: databasePath as String)
            
            if (collegeDB.open()) {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS STUDENTS (ID TEXT PRIMARY KEY, NAME TEXT, PROGRAM TEXT, GRADE_AVERAGE TEXT)"
                if !(collegeDB.executeStatements(sql_stmt)) {
                    print("Error: \(collegeDB.lastErrorMessage())")
                }
                collegeDB.close()
            } else {
                print("Error: \(collegeDB.lastErrorMessage())")
            }
        }
    }
    
    @IBAction func saveRecord() {
            let collegeDB = FMDatabase(path: databasePath as String)
            if (collegeDB.open()) {
                let insertSQL = "INSERT INTO STUDENTS(ID, NAME, PROGRAM, GRADE_AVERAGE) VALUES('\(idField.text!)', '\(nameField.text!)', '\(programField.text!)', '\(gradeField.text!)')"
                
                let result = collegeDB.executeUpdate(insertSQL, withArgumentsIn: [])
                
                if (!result) {
                    statusField.text = "Failed to add student."
                    print("Error: \(collegeDB.lastErrorMessage())")
                } else {
                    statusField.text = "Student added."
                    nameField.text = ""
                    idField.text = ""
                    programField.text = ""
                    gradeField.text = ""
                }
            } else {
                print("Error: \(collegeDB.lastErrorMessage())")
            }
    }
    
    @IBAction func findRecord() {
            let collegeDB = FMDatabase(path: databasePath as String)
            if (collegeDB.open()) {
                let querySQL = "SELECT NAME, PROGRAM, GRADE_AVERAGE FROM STUDENTS WHERE id = '\(idField.text!)'"
                let results:FMResultSet? = collegeDB.executeQuery(querySQL, withArgumentsIn: [])
                if results?.next() == true {
                    nameField.text = results?.string(forColumn: "NAME")
                    programField.text = results?.string(forColumn: "PROGRAM")
                    gradeField.text = results?.string(forColumn: "GRADE_AVERAGE")
                    statusField.text = "Record Found."
                } else {
                    statusField.text = "Record not found."
                    nameField.text = ""
                    programField.text = ""
                    gradeField.text = ""
                }
                collegeDB.close() }
            else {
                print("Error: \(collegeDB.lastErrorMessage())")
            }
    }
    
    @IBAction func updateRecord() {
            let collegeDB = FMDatabase(path: databasePath as String)
            if (collegeDB.open()) {
                let updateSQL = "UPDATE STUDENTS SET NAME = '\(nameField.text!)', PROGRAM = '\(programField.text!)', GRADE_AVERAGE = '\(gradeField.text!)' WHERE ID = '\(idField.text!)'"
                let result = collegeDB.executeUpdate(updateSQL, withArgumentsIn: [])
                if !result {
                    statusField.text = "Failed to update student."
                    print("Error: \(collegeDB.lastErrorMessage())")
                } else {
                    statusField.text = "Student Updated."
                    nameField.text = ""
                    idField.text = ""
                    programField.text = ""
                    gradeField.text = ""
                }
                collegeDB.close() }
            else {
                print("Error: \(collegeDB.lastErrorMessage())")
            }
    }
    
    @IBAction func deleteRecord() {
            let collegeDB = FMDatabase(path: databasePath as String)
            if (collegeDB.open()) {
            let deleteSQL = "DELETE FROM STUDENTS WHERE ID = '\(idField.text!)'"
            let result = collegeDB.executeUpdate(deleteSQL, withArgumentsIn: [])
                if !result {
                    statusField.text = "Failed to delete student."
                    print("Error: \(collegeDB.lastErrorMessage())")
                } else {
                    statusField.text = "Student deleted."
                    nameField.text = ""
                    idField.text = ""
                    programField.text = ""
                    gradeField.text = ""
                }
                collegeDB.close()
            } else {
                print("Error: \(collegeDB.lastErrorMessage())")
            }
    }
    
    @IBAction func onSegmentChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            saveRecord()
        } else if sender.selectedSegmentIndex == 1 {
            findRecord()
        } else if sender.selectedSegmentIndex == 2 {
            updateRecord()
        } else {
            deleteRecord()
        }
    }
    
}

