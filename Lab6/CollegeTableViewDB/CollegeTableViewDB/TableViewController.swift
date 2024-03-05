//
//  TableViewController.swift
//  CollegeTableViewDB
//
//  Created by Jacob Labelle on 2024-03-03.
//

import UIKit

class TableViewController: UITableViewController {
    var databasePath = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToAddView" {
            let sdest = segue.destination as? AddViewController
            sdest?.dbPath = databasePath as String
        } else if segue.identifier == "ToFindView" {
            let sdest = segue.destination as? FindViewController
            sdest?.dbPath = databasePath as String
        } else if segue.identifier == "ToUpdateView" {
            let sdest = segue.destination as? UpdateViewController
            sdest?.dbPath = databasePath as String
        } else {
            let sdest = segue.destination as? DeleteViewController
            sdest?.dbPath = databasePath as String
        }

    }
}
