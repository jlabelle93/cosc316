//
//  GameViewController.swift
//  SKSimpleGame
//
//  Created by Daniel Ling on 2020-02-15.
//  Copyright © 2020 Daniel Ling. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.presentScene(scene)
    }
  
}
