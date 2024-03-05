//
//  SecondViewController.swift
//  TabBarController
//
//  Created by Student on 2024-02-13.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var view2DisplayLabel: UILabel!
    @IBOutlet weak var view2TextField: UITextField!
    
    override func viewWillDisappear(_ animated: Bool) {
        if let firstTab = self.tabBarController!.viewControllers![0] as? FirstViewController {
            firstTab.view1DisplayLabel.text = view2TextField.text! + " from Page2!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}
