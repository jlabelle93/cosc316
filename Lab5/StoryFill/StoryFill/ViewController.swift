//
//  ViewController.swift
//  StoryFill
//
//  Created by Jacob Labelle on 2024-02-10.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var verbLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var templateText: UITextView!
    @IBOutlet weak var storyText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitToHere(_ sender: UIStoryboardSegue) {
        storyText.text = ""
    }
    
    @IBAction func createStory(_ sender: Any) {
        var output: String = templateText.text
        
        output = output.replacingOccurrences(of: "<place>", with: placeLabel.text ?? "Kelowna")
        output = output.replacingOccurrences(of: "<verb>", with: verbLabel.text ?? "drink")
        output = output.replacingOccurrences(of: "<number>", with: numberLabel.text ?? "12")
        
        storyText.text = output
    }
    
}

