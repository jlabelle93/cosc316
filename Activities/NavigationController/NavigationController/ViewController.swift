//
//  ViewController.swift
//  NavigationController
//
//  Created by Jacob Labelle on 2024-02-18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1Label: UILabel!
    @IBOutlet weak var view1Textfield: UITextField!
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        let sdtest = segue.destination as! SecondViewController
        sdtest.fromViewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

