//
//  GameScene.swift
//  SKSimpleGame
//
//  Created by Daniel Ling on 2020-02-15.
//  Copyright © 2020 Daniel Ling. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    let label = SKLabelNode(text: "Hello SpriteKit!")
  
    override func didMove(to view: SKView) {
        addChild(label)
        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        label.fontSize = 45
        label.fontColor = SKColor.yellow
        label.fontName = "Avenir"
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(recognizer)
        
        
    }
    

    @objc func tap(recognizer: UIGestureRecognizer) {
        let viewLocation = recognizer.location(in: view)
        let sceneLocation = convertPoint(fromView: viewLocation)
    /*
        let moveToAction = SKAction.move(to: sceneLocation, duration: 1)
        label.run(moveToAction)
     */
     /*
        let moveByAction = SKAction.moveBy(x: sceneLocation.x - label.position.x, y: sceneLocation.y - label.position.y, duration: 1)
        label.run(moveByAction)
      */
        
       let moveByAction = SKAction.moveBy(x: sceneLocation.x - label.position.x, y: sceneLocation.y - label.position.y, duration: 1)
        let moveByReversedAction = moveByAction.reversed()
        let moveByActions = [moveByAction, moveByReversedAction]
        let moveSequence = SKAction.sequence(moveByActions)
        label.run(moveSequence)
        
        
     /*
        let moveRepeatSequence = SKAction.repeat(moveSequence, count: 3)
        label.run(moveRepeatSequence)
    */
    
    /*
        let moveRepeatForeverSequence = SKAction.repeatForever(moveSequence)
        label.run(moveRepeatForeverSequence)
    */
        
    }
}
