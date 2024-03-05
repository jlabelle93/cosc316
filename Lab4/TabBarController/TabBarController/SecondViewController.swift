//
//  ViewController.swift
//  TabBarController
//
//  Created by Jacob Labelle on 2024-02-11.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let firstTab = self.tabBarController!.viewControllers![0] as? FirstViewController {
            firstTab.firstLabel.text = secondTextField.text! + " from Page2!"
        }
    }

}

