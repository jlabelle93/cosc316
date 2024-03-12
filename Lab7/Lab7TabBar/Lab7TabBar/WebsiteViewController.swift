//
//  WebsiteViewController.swift
//  Lab7TabBar
//
//  Created by Jacob Labelle on 2024-03-10.
//

import UIKit
import WebKit

class WebsiteViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myURL = URL(string: "http://192.168.161.128/Login/login.php")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

}
