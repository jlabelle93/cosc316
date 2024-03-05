//
//  ViewController.swift
//  COSC316-FirstApp
//
//  Created by Student on 2024-01-30.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var imageOutput: UIImageView!
    
    @IBAction func buttonPressed(_ sender: Any) {
        outputLabel.text = "Hello, " + inputTextField.text!
        imageOutput.image = UIImageView("norway.jpg")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.inputTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.resignFirstResponder()
        return true
    }

}

