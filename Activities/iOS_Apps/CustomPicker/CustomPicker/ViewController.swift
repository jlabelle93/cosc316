//
//  ViewController.swift
//  CustomPicker
//
//  Created by Student on 2024-02-13.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var triplePicker: UIPickerView!
    
    private let fillingComponent = 0
    private let breadComponent = 1
    private let quantityComponent = 2
    private let fillingTypes = ["Ham", "Turkey", "Peanut Butter", "Tuna Salad","Chicken Salad", "Roast Beef", "Vegemite"]
    private let breadTypes = ["White", "Whole Wheat", "Rye", "Sourdough",
        "Seven Grain"]
    private let quantityTypes = ["1", "2", "3", "4", "5"]
    
    @IBAction func selectPicker(_ sender: Any) {
      let fillingRow = triplePicker.selectedRow(inComponent: fillingComponent)
      let breadRow = triplePicker.selectedRow(inComponent: breadComponent)
        let quantityRow = triplePicker.selectedRow(inComponent: quantityComponent)
        let quantity = quantityTypes[quantityRow]

        
      let filling = fillingTypes[fillingRow]
      let bread = breadTypes[breadRow]
      let message = "Your \(quantity) orders  of \(filling) on \(bread) bread will be right up."
        
       // create an Alert message to display the selected items
      let alert = UIAlertController(
            title: "Thank you for your order",
            message: message,
            preferredStyle: .alert)
      let action = UIAlertAction(
            title: "Great",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    /*
    two methods below need to be implemented for
     UIPickerViewDataSource protocol
     */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // the exact number needs to be determined later
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // the number of rows for each component needs to be determined later
        if component == quantityComponent {
            return quantityTypes.count
        }
        else if component == breadComponent {
            return breadTypes.count
        } else {
            return fillingTypes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //component string needs to be determined to be returned
        
        if component == quantityComponent {
            return quantityTypes[row]
        }
        else if component == breadComponent {
            return breadTypes[row]
        } else {
            return fillingTypes[row]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        triplePicker.delegate = self
        triplePicker.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }

 }


