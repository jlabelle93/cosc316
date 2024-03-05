//
//  EditiewController.swift
//  MyModalEditor
//
//  Created by Jacob Labelle on 2024-02-06.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateEditor(_ sender: Any) {
        (presentingViewController as! ViewController).emailLabel.text = emailField.text
        performSegue(withIdentifier: "UnwindSegueToVC", sender: self)
    }
    
    @IBAction func hideKeyboard(_ sender: AnyObject) {
        emailField.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailField.text = (presentingViewController as! ViewController).emailLabel.text
        super.viewWillAppear(animated)
    }
}

