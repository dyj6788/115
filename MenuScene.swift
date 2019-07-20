//
//  MenuScene.swift
//  ImpossibleRush
//
//  Created by Nguyen Dac Phuoc on 9/17/15.
//  Copyright (c) 2015 Game Developer. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    var buttonPlay:SKSpriteNode?
    var buttonPrivacy:SimpleLabel?
    
    override func didMove(to view: SKView) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "showAd"), object: nil)
        
        backgroundColor = UIColor.white
        
//        var userDefaults = NSUserDefaults.standardUserDefaults()
//        var object: AnyObject? = userDefaults.valueForKey("highscore")
//        if(object != nil) {
//            var highScore = object as! Int
//            println(highScore)
//        }
        
        buttonPlay = SKSpriteNode(imageNamed: "buttonPlay.png")
        buttonPlay?.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        buttonPlay?.name = "buttonPlay"
        self.addChild(buttonPlay!)
        
        buttonPrivacy = SimpleLabel.init(text: "Privacy", fontSize: 30, position: CGPoint(x: self.size.width/2, y: self.size.height/2 - 400), colorByHEX: "#ff0000", andZPosition: 6)
           buttonPrivacy?.name = "buttonPrivacy"
        self.addChild(buttonPrivacy!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches ) {
            let location = touch.location(in: self)            
            let node:SKNode = self.atPoint(location)
            
            if(node.name == "buttonPlay") {
                let actionButtonPlay:SKAction = SKAction.scale(to: 0.9, duration: 0.1)
                buttonPlay?.run(actionButtonPlay, completion: {
                    let gameScene = GameScene(size: self.size)
                    self.view?.presentScene(gameScene)
                })
            }else if(node.name == "buttonPrivacy"){
                UIUtil.switchPrivacy();
            }
        }
    }
}
