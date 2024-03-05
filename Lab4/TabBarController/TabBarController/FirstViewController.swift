//
//  ViewController.swift
//  TabBarController
//
//  Created by Jacob Labelle on 2024-02-11.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let secondTab = self.tabBarController!.viewControllers![1] as? SecondViewController {
            secondTab.secondLabel.text = firstTextField.text! + " from Page1!"
        }
    }


}

