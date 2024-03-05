//
//  ViewController.swift
//  BunniesHop
//
//  Created by Jacob Labelle on 2024-02-10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bunn1: UIImageView!
    @IBOutlet weak var bunn2: UIImageView!
    @IBOutlet weak var speedControl: UISegmentedControl!
    @IBOutlet weak var hopsPerSecond: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    let SPEED: [Double] = [0.5, 0.67, 1.0, 2.0, 4.0]
    
    @IBAction func toggleAnimation(_ sender: Any) {
        if (bunn1.isAnimating) {
            bunn1.stopAnimating()
            bunn2.stopAnimating()
            toggleButton.setTitle("Hop!", for: UIControl.State())
        } else {
            bunn1.startAnimating()
            bunn2.startAnimating()
            toggleButton.setTitle("Sit Still!", for: UIControl.State())
        }
        hopsPerSecond.text = String(SPEED[speedControl.selectedSegmentIndex]) + " hps"
    }
    
    @IBAction func setSpeed(_ sender: UISegmentedControl) {
        var animSpeed = SPEED[speedControl.selectedSegmentIndex]
        bunn1.animationDuration = TimeInterval(2.0 - animSpeed)
        bunn2.animationDuration = bunn1.animationDuration
        
        bunn1.startAnimating()
        bunn2.startAnimating()
        
        toggleButton.setTitle("Sit Still!", for: UIControl.State())
        hopsPerSecond.text = String(animSpeed) + " hps"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hopAnimation1: [UIImage] = [
            UIImage(named: "frame-1")!,
            UIImage(named: "frame-2")!,
            UIImage(named: "frame-3")!,
            UIImage(named: "frame-4")!,
            UIImage(named: "frame-5")!,
            UIImage(named: "frame-6")!,
            UIImage(named: "frame-7")!,
            UIImage(named: "frame-8")!,
            UIImage(named: "frame-9")!,
            UIImage(named: "frame-10")!,
            UIImage(named: "frame-11")!,
            UIImage(named: "frame-12")!,
            UIImage(named: "frame-13")!,
            UIImage(named: "frame-14")!,
            UIImage(named: "frame-15")!,
            UIImage(named: "frame-16")!,
            UIImage(named: "frame-17")!,
            UIImage(named: "frame-18")!,
            UIImage(named: "frame-19")!,
            UIImage(named: "frame-20")!
        ]
        
        let hopAnimation2: [UIImage] = [
            UIImage(named: "frame-10")!,
            UIImage(named: "frame-11")!,
            UIImage(named: "frame-12")!,
            UIImage(named: "frame-13")!,
            UIImage(named: "frame-14")!,
            UIImage(named: "frame-15")!,
            UIImage(named: "frame-16")!,
            UIImage(named: "frame-17")!,
            UIImage(named: "frame-18")!,
            UIImage(named: "frame-19")!,
            UIImage(named: "frame-20")!,
            UIImage(named: "frame-1")!,
            UIImage(named: "frame-2")!,
            UIImage(named: "frame-3")!,
            UIImage(named: "frame-4")!,
            UIImage(named: "frame-5")!,
            UIImage(named: "frame-6")!,
            UIImage(named: "frame-7")!,
            UIImage(named: "frame-8")!,
            UIImage(named: "frame-9")!
        ]
        bunn1.animationImages = hopAnimation1
        bunn2.animationImages = hopAnimation2
        bunn1.animationDuration = 1.0
        bunn2.animationDuration = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

