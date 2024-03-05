//
//  ViewController.swift
//  ShowImageswithControls
//
//  Created by Jacob Labelle on 2024-02-04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageChoice: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setValue(_ sender: Any) {
        if (imageSlider.value < 0.34) {
            imageView.image = UIImage(named: "norway")
        } else if (imageSlider.value > 0.67){
            imageView.image = UIImage(named: "forest_park")
        } else {
            imageView.image = UIImage(named: "italy")
        }
    }
    
    @IBAction func getImage(_ sender: Any) {
        let imageNum = imageChoice.selectedSegmentIndex
        switch imageNum {
            case 0:
                imageView.image = UIImage(named: "norway")
                break
            case 1:
                imageView.image = UIImage(named: "italy")
                break
            case 2:
                imageView.image = UIImage(named: "forest_park")
                break
            default:
                break
        }
    }
}
