//
//  WebsiteViewController.swift
//  Lab7TabBar
//
//  Created by Jacob Labelle on 2024-03-10.
//

import UIKit

class WebsiteViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myURL = URL(string: "https://www.google.ca/")
        let myRequest = URLRequest(url: myURL!)
        webView.loadRequest(myRequest)
    }

}
