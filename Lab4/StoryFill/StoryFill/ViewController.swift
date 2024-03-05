//
//  ViewController.swift
//  StoryFill
//
//  Created by Jacob Labelle on 2024-02-10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeField: UITextField!
    @IBOutlet weak var verbField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var templateText: UITextView!
    @IBOutlet weak var storyText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(_ sender: AnyObject) {
        placeField.resignFirstResponder()
        verbField.resignFirstResponder()
        numberField.resignFirstResponder()
    }

    @IBAction func createStory(_ sender: Any) {
        var output: String = templateText.text
        
        output = output.replacingOccurrences(of: "<place>", with: placeField.text ?? "Kelowna")
        output = output.replacingOccurrences(of: "<verb>", with: verbField.text ?? "code")
        output = output.replacingOccurrences(of: "<number>", with: numberField.text ?? "1000")
        storyText.text = output
    }
    
}

