//
//  PickerController.swift
//  StoryFill
//
//  Created by Jacob Labelle on 2024-02-18.
//

import UIKit

class PickerController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var wordsPicker: UIPickerView!
    
    private let NUM_OPTIONS: Int = 3
    private let PLACES = 0
    private let VERBS = 1
    private let NUMS = 2
    private let places = ["Kamloops", "Kelowna", "Penticton", "Vernon"]
    private let verbs = ["eat", "play", "drink", "party", "laugh"]
    private let numbers = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    
    @IBAction func selectOptions(_ sender: Any) {
        let placeRow = wordsPicker.selectedRow(inComponent: PLACES)
        let verbRow = wordsPicker.selectedRow(inComponent: VERBS)
        let numberRow = wordsPicker.selectedRow(inComponent: NUMS)
        
        let selPlace = places[placeRow]
        let selVerb = verbs[verbRow]
        let selNumber = numbers[numberRow]
        
        (presentingViewController as! ViewController).placeLabel.text = selPlace
        (presentingViewController as! ViewController).verbLabel.text = selVerb
        (presentingViewController as! ViewController).numberLabel.text = selNumber
        
        performSegue(withIdentifier: "ExitToStory", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordsPicker.delegate = self
        wordsPicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return NUM_OPTIONS
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == PLACES {
            return places.count
        } else if component == VERBS {
            return verbs.count
        } else {
            return numbers.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == PLACES {
            return places[row]
        } else if component == VERBS {
            return verbs[row]
        } else {
            return numbers[row]
        }
    }
}
