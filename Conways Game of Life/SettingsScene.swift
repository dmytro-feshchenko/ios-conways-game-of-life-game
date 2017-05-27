//
//  SettingsScene.swift
//  Conways Game of Life
//
//  Created by Дмитрий Фещенко on 9/4/16.
//  Copyright © 2016 Dmitryi Feschenko. All rights reserved.
//

import UIKit
import SpriteKit

class SettingsScene: SKScene, UITextFieldDelegate {
    var _backButton: SKSpriteNode = SKSpriteNode(imageNamed: "button-go-back.png")
    var _inputChanceDieWith8Neighbours: UITextField!
    var _inputChanceDieWith7Neighbours: UITextField!
    var _inputChanceDieWith6Neighbours: UITextField!
    var _inputChanceDieWith5Neighbours: UITextField!
    var _inputChanceDieWith4Neighbours: UITextField!
    var _inputChanceDieWith1Neighbours: UITextField!
    var _inputChanceDieWith0Neighbours: UITextField!
    
    var _chanceDieWith8Neighbours: Int = 100
    var _chanceDieWith7Neighbours: Int = 100
    var _chanceDieWith6Neighbours: Int = 100
    var _chanceDieWith5Neighbours: Int = 100
    var _chanceDieWith4Neighbours: Int = 100
    var _chanceDieWith1Neighbours: Int = 100
    var _chanceDieWith0Neighbours: Int = 100
    
    let _chanceDieWith8NeighboursLabel:SKLabelNode = SKLabelNode(text: "Chance to die with 8 neighbours:")
    let _chanceDieWith7NeighboursLabel:SKLabelNode = SKLabelNode(text: "Chance to die with 7 neighbours:")
    let _chanceDieWith6NeighboursLabel:SKLabelNode = SKLabelNode(text: "Chance to die with 6 neighbours:")
    let _chanceDieWith5NeighboursLabel:SKLabelNode = SKLabelNode(text: "Chance to die with 5 neighbours:")
    let _chanceDieWith4NeighboursLabel:SKLabelNode = SKLabelNode(text: "Chance to die with 4 neighbours:")
    let _chanceDieWith1NeighboursLabel:SKLabelNode = SKLabelNode(text: "Chance to die with 1 neighbour:")
    let _chanceDieWith0NeighboursLabel:SKLabelNode = SKLabelNode(text: "Chance to die with 0 neighbours:")
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background2.jpg")
        background.anchorPoint = CGPoint(x: 0, y: 0);
        background.size = self.size
        background.zPosition = -2
        self.addChild(background)
        
        _backButton.position = CGPoint(x: 50, y: 25)
        _backButton.name = "backButton"
        _backButton.setScale(0.20)
        self.addChild(_backButton)
        
        _chanceDieWith0NeighboursLabel.position = CGPoint(x: 280, y: 290)
        _chanceDieWith0NeighboursLabel.fontName = "AmericanTypewriter-Bold"
        _chanceDieWith0NeighboursLabel.fontSize = 12
        _chanceDieWith0NeighboursLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        _chanceDieWith0NeighboursLabel.zPosition = 10;
        self.addChild(_chanceDieWith0NeighboursLabel)
        
        _chanceDieWith1NeighboursLabel.position = CGPoint(x: 280, y: 250)
        _chanceDieWith1NeighboursLabel.fontName = "AmericanTypewriter-Bold"
        _chanceDieWith1NeighboursLabel.fontSize = 12
        _chanceDieWith1NeighboursLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        _chanceDieWith1NeighboursLabel.zPosition = 10;
        self.addChild(_chanceDieWith1NeighboursLabel)
        
        _chanceDieWith4NeighboursLabel.position = CGPoint(x: 280, y: 210)
        _chanceDieWith4NeighboursLabel.fontName = "AmericanTypewriter-Bold"
        _chanceDieWith4NeighboursLabel.fontSize = 12
        _chanceDieWith4NeighboursLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        _chanceDieWith4NeighboursLabel.zPosition = 10;
        self.addChild(_chanceDieWith4NeighboursLabel)
        
        _chanceDieWith5NeighboursLabel.position = CGPoint(x: 280, y: 170)
        _chanceDieWith5NeighboursLabel.fontName = "AmericanTypewriter-Bold"
        _chanceDieWith5NeighboursLabel.fontSize = 12
        _chanceDieWith5NeighboursLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        _chanceDieWith5NeighboursLabel.zPosition = 10;
        self.addChild(_chanceDieWith5NeighboursLabel)
        
        _chanceDieWith6NeighboursLabel.position = CGPoint(x: 280, y: 130)
        _chanceDieWith6NeighboursLabel.fontName = "AmericanTypewriter-Bold"
        _chanceDieWith6NeighboursLabel.fontSize = 12
        _chanceDieWith6NeighboursLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        _chanceDieWith6NeighboursLabel.zPosition = 10;
        self.addChild(_chanceDieWith6NeighboursLabel)
        
        _chanceDieWith7NeighboursLabel.position = CGPoint(x: 280, y: 90)
        _chanceDieWith7NeighboursLabel.fontName = "AmericanTypewriter-Bold"
        _chanceDieWith7NeighboursLabel.fontSize = 12
        _chanceDieWith7NeighboursLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        _chanceDieWith7NeighboursLabel.zPosition = 10;
        self.addChild(_chanceDieWith7NeighboursLabel)
        
        _chanceDieWith8NeighboursLabel.position = CGPoint(x: 280, y: 50)
        _chanceDieWith8NeighboursLabel.fontName = "AmericanTypewriter-Bold"
        _chanceDieWith8NeighboursLabel.fontSize = 12
        _chanceDieWith8NeighboursLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        _chanceDieWith8NeighboursLabel.zPosition = 10;
        self.addChild(_chanceDieWith8NeighboursLabel)
        
        _inputChanceDieWith0Neighbours = UITextField(frame: CGRect(x: view.bounds.width - 160, y: view.bounds.height / 2 - 190, width: 100, height: 40))
        _inputChanceDieWith0Neighbours.borderStyle = UITextBorderStyle.roundedRect
        _inputChanceDieWith0Neighbours.textColor = SKColor.black
        _inputChanceDieWith0Neighbours.placeholder = "Chance to die with 0 neighbours:"
        _inputChanceDieWith0Neighbours.text = "\(_chanceDieWith0Neighbours)"
        _inputChanceDieWith0Neighbours.backgroundColor = SKColor.white
        self.view!.addSubview(_inputChanceDieWith0Neighbours)
        
        _inputChanceDieWith1Neighbours = UITextField(frame: CGRect(x: view.bounds.width - 160, y: view.bounds.height / 2 - 140, width: 100, height: 40))
        _inputChanceDieWith1Neighbours.borderStyle = UITextBorderStyle.roundedRect
        _inputChanceDieWith1Neighbours.textColor = SKColor.black
        _inputChanceDieWith1Neighbours.placeholder = "Chance to die with 1 neighbour:"
        _inputChanceDieWith1Neighbours.text = "\(_chanceDieWith1Neighbours)"
        _inputChanceDieWith1Neighbours.backgroundColor = SKColor.white
        self.view!.addSubview(_inputChanceDieWith1Neighbours)
        
        _inputChanceDieWith4Neighbours = UITextField(frame: CGRect(x: view.bounds.width - 160, y: view.bounds.height / 2 - 90, width: 100, height: 40))
        _inputChanceDieWith4Neighbours.borderStyle = UITextBorderStyle.roundedRect
        _inputChanceDieWith4Neighbours.textColor = SKColor.black
        _inputChanceDieWith4Neighbours.placeholder = "Chance to die with 4 neighbours:"
        _inputChanceDieWith4Neighbours.text = "\(_chanceDieWith4Neighbours)"
        _inputChanceDieWith4Neighbours.backgroundColor = SKColor.white
        self.view!.addSubview(_inputChanceDieWith4Neighbours)
        
        _inputChanceDieWith5Neighbours = UITextField(frame: CGRect(x: view.bounds.width - 160, y: view.bounds.height / 2 - 40, width: 100, height: 40))
        _inputChanceDieWith5Neighbours.borderStyle = UITextBorderStyle.roundedRect
        _inputChanceDieWith5Neighbours.textColor = SKColor.black
        _inputChanceDieWith5Neighbours.placeholder = "Chance to die with 5 neighbours:"
        _inputChanceDieWith5Neighbours.text = "\(_chanceDieWith5Neighbours)"
        _inputChanceDieWith5Neighbours.backgroundColor = SKColor.white
        self.view!.addSubview(_inputChanceDieWith5Neighbours)
        
        _inputChanceDieWith6Neighbours = UITextField(frame: CGRect(x: view.bounds.width - 160, y: view.bounds.height / 2 + 10, width: 100, height: 40))
        _inputChanceDieWith6Neighbours.borderStyle = UITextBorderStyle.roundedRect
        _inputChanceDieWith6Neighbours.textColor = SKColor.black
        _inputChanceDieWith6Neighbours.placeholder = "Chance to die with 6 neighbours:"
        _inputChanceDieWith6Neighbours.text = "\(_chanceDieWith6Neighbours)"
        _inputChanceDieWith6Neighbours.backgroundColor = SKColor.white
        self.view!.addSubview(_inputChanceDieWith6Neighbours)
        
        _inputChanceDieWith7Neighbours = UITextField(frame: CGRect(x: view.bounds.width - 160, y: view.bounds.height / 2 + 60, width: 100, height: 40))
        _inputChanceDieWith7Neighbours.borderStyle = UITextBorderStyle.roundedRect
        _inputChanceDieWith7Neighbours.textColor = SKColor.black
        _inputChanceDieWith7Neighbours.placeholder = "Chance to die with 7 neighbours:"
        _inputChanceDieWith7Neighbours.text = "\(_chanceDieWith7Neighbours)"
        _inputChanceDieWith7Neighbours.backgroundColor = SKColor.white
        self.view!.addSubview(_inputChanceDieWith7Neighbours)
        
        
        _inputChanceDieWith8Neighbours = UITextField(frame: CGRect(x: view.bounds.width - 160, y: view.bounds.height / 2 + 110, width: 100, height: 40))
        _inputChanceDieWith8Neighbours.borderStyle = UITextBorderStyle.roundedRect
        _inputChanceDieWith8Neighbours.textColor = SKColor.black
        _inputChanceDieWith8Neighbours.placeholder = "Chance to die with 8 neighbours:"
        _inputChanceDieWith8Neighbours.text = "\(_chanceDieWith8Neighbours)"
        _inputChanceDieWith8Neighbours.backgroundColor = SKColor.white
        self.view!.addSubview(_inputChanceDieWith8Neighbours)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            if _backButton.frame.contains(touch.location(in: self)) {
                let gameScene = GameScene(size: self.size)
                gameScene._chanceDieWith0Neighbours = (Int(_inputChanceDieWith0Neighbours.text!))!
                gameScene._chanceDieWith1Neighbours = (Int(_inputChanceDieWith1Neighbours.text!))!
                gameScene._chanceDieWith4Neighbours = (Int(_inputChanceDieWith4Neighbours.text!))!
                gameScene._chanceDieWith5Neighbours = (Int(_inputChanceDieWith5Neighbours.text!))!
                gameScene._chanceDieWith6Neighbours = (Int(_inputChanceDieWith6Neighbours.text!))!
                gameScene._chanceDieWith7Neighbours = (Int(_inputChanceDieWith7Neighbours.text!))!
                gameScene._chanceDieWith8Neighbours = (Int(_inputChanceDieWith8Neighbours.text!))!
                
                _inputChanceDieWith0Neighbours.removeFromSuperview()
                _inputChanceDieWith1Neighbours.removeFromSuperview()
                _inputChanceDieWith4Neighbours.removeFromSuperview()
                _inputChanceDieWith5Neighbours.removeFromSuperview()
                _inputChanceDieWith6Neighbours.removeFromSuperview()
                _inputChanceDieWith7Neighbours.removeFromSuperview()
                _inputChanceDieWith8Neighbours.removeFromSuperview()
                
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
                gameScene.scaleMode = SKSceneScaleMode.aspectFill
              
                self.scene!.view?.presentScene(gameScene, transition: transition)
            }
        }
    }
}
