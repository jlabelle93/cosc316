//
//  SecondViewController.swift
//  TabbedApplication
//
//  Created by Jacob Labelle on 2024-02-18.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var view2Label: UILabel!
    @IBOutlet weak var view2Textfield: UITextField!
    
    override func viewDidDisappear(_ animated: Bool) {
        if let firstTab = self.tabBarController!.viewControllers![0] as? FirstViewController {
            firstTab.view1Label.text = "Okay, " + self.view2Textfield.text! + "!"
        }
    }
    
    @IBAction func textfieldDoneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

