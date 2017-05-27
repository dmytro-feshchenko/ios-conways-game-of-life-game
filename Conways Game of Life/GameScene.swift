//
//  GameScene.swift
//  Conways Game of Life
//
//  Created by Дмитрий Фещенко on 9/4/16.
//  Copyright (c) 2016 Dmitryi Feschenko. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let _gridWidth = 400
    let _gridHeight = 300
    let _numRows = 8
    let _numCols = 10
    let _gridLowerLeftCorner:CGPoint = CGPoint(x: 158, y: 10)
    
    let _populationLabel:SKLabelNode = SKLabelNode(text: "Population")
    let _generationLabel:SKLabelNode = SKLabelNode(text: "Generation")
    var _populationValueLabel:SKLabelNode = SKLabelNode(text: "0")
    var _generationValueLabel:SKLabelNode = SKLabelNode(text: "0")
    var _playButton:SKSpriteNode = SKSpriteNode(imageNamed:"button-next")
    var _pauseButton:SKSpriteNode = SKSpriteNode(imageNamed:"button-pause")
    var _settingsButton: SKSpriteNode = SKSpriteNode(imageNamed: "button-settings.ico")
    
    var _tiles:[[Tile]] = []
    var _margin = 4
    
    var _isPlaying = false
    
    var _prevTime:CFTimeInterval = 0
    var _timeCounter:CFTimeInterval = 0
    
    var _chanceDieWith8Neighbours: Int = 100
    var _chanceDieWith7Neighbours: Int = 100
    var _chanceDieWith6Neighbours: Int = 100
    var _chanceDieWith5Neighbours: Int = 100
    var _chanceDieWith4Neighbours: Int = 100
    var _chanceDieWith1Neighbours: Int = 100
    var _chanceDieWith0Neighbours: Int = 100
    
    func playButtonPressed()
    {
        _generation = 0
        _isPlaying = true
    }
    
    func pauseButtonPressed()
    {
        _isPlaying = false
    }
    
    var _population:Int = 0 {
        didSet {
            _populationValueLabel.text = "\(_population)"
        }
    }
    
    var _generation:Int = 0 {
        didSet {
            _generationValueLabel.text = "\(_generation)"
        }
    }
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        let background = SKSpriteNode(imageNamed: "background2.jpg")
        background.anchorPoint = CGPoint(x: 0, y: 0);
        background.size = self.size
        background.zPosition = -2
        self.addChild(background)
        
        let gridBackground = SKSpriteNode(imageNamed: "grid3.png")
        gridBackground.size = CGSize(width: _gridWidth, height: _gridHeight)
        gridBackground.zPosition = -1
        gridBackground.anchorPoint = CGPoint(x:0, y:0)
        gridBackground.position = _gridLowerLeftCorner
        self.addChild(gridBackground)
        
        _playButton.position = CGPoint(x: 45, y: 280)
        _playButton.setScale(0.5)
        self.addChild(_playButton)
        
        _pauseButton.position = CGPoint(x: 115, y: 280)
        _pauseButton.setScale(0.5)
        self.addChild(_pauseButton)
        
        _settingsButton.position = CGPoint(x: 79, y: 230)
        _settingsButton.setScale(0.25)
        self.addChild(_settingsButton)
        
        // add a balloon background for the stats
        let balloon = SKSpriteNode(imageNamed: "board.png")
        balloon.position = CGPoint(x: 79, y: 50)
        balloon.setScale(0.5)
        self.addChild(balloon)
        //        // add a microscope image as a decoration
        //        let microscope = SKSpriteNode(imageNamed: "ember.png")
        //        microscope.position = CGPoint(x: 79, y: 70)
        //        microscope.setScale(0.4)
        //        self.addChild(microscope)
        // dark green labels to keep track of number of living tiles
        // and number of steps the simulation has gone through
        _populationLabel.position = CGPoint(x: 79, y: 80)
        _populationLabel.fontName = "Courier-Oblique"
        _populationLabel.fontSize = 10
        _populationLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        _populationLabel.zPosition = 10;
        self.addChild(_populationLabel)
        _generationLabel.position = CGPoint(x: 79, y: 50)
        _generationLabel.fontName = "Courier-Oblique"
        _generationLabel.fontSize = 10
        _generationLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        _generationLabel.zPosition = 10;
        self.addChild(_generationLabel)
        _populationValueLabel.position = CGPoint(x: 79, y: 65)
        _populationValueLabel.fontName = "Courier-Oblique"
        _populationValueLabel.fontSize = 10
        _populationValueLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        _populationValueLabel.zPosition = 10;
        self.addChild(_populationValueLabel)
        _generationValueLabel.position = CGPoint(x: 79, y: 35)
        _generationValueLabel.fontName = "Courier-Oblique"
        _generationValueLabel.fontSize = 10
        _generationValueLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        _generationValueLabel.zPosition = 10;
        self.addChild(_generationValueLabel)
        
        
        // initialize the 2d array of tiles
        let tileSize = calculateTileSize()
        for r in 0..<_numRows {
            var tileRow:[Tile] = []
            for c in 0..<_numCols {
                let tile = Tile(imageNamed: "creature\(arc4random_uniform(5) + 1).png")
                tile.isAlive = false;
                tile.size = CGSize(width: tileSize.width, height: tileSize.height)
                tile.anchorPoint = CGPoint(x: 0, y: 0)
                tile.position = getTilePosition(row: r, column: c)
                self.addChild(tile)
                tileRow.append(tile)
            }
            _tiles.append(tileRow)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let selectedTile:Tile? = getTileAtPosition(xPos: Int(touch.location(in: self).x), yPos: Int(touch.location(in: self).y))
            if let tile = selectedTile {
                tile.isAlive = !tile.isAlive
                if tile.isAlive {
                    _population+=1
                } else {
                    _population-=1
                }
            }
            
            if _playButton.frame.contains(touch.location(in: self)) {
                playButtonPressed()
            }
            if _pauseButton.frame.contains(touch.location(in: self)) {
                pauseButtonPressed()
            }
            
            if _settingsButton.frame.contains(touch.location(in: self)) {
                let settingsScene = SettingsScene(size: self.size)
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
                settingsScene.scaleMode = SKSceneScaleMode.aspectFill
                settingsScene._chanceDieWith0Neighbours = _chanceDieWith0Neighbours
                settingsScene._chanceDieWith1Neighbours = _chanceDieWith1Neighbours
                settingsScene._chanceDieWith4Neighbours = _chanceDieWith4Neighbours
                settingsScene._chanceDieWith5Neighbours = _chanceDieWith5Neighbours
                settingsScene._chanceDieWith6Neighbours = _chanceDieWith6Neighbours
                settingsScene._chanceDieWith7Neighbours = _chanceDieWith7Neighbours
                settingsScene._chanceDieWith8Neighbours = _chanceDieWith8Neighbours
                self.scene!.view?.presentScene(settingsScene, transition: transition)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        if _prevTime == 0 {
            _prevTime = currentTime
        }
        if _isPlaying && _population != 0
        {
            _timeCounter += currentTime - _prevTime
            if _timeCounter > 0.5 {
                _timeCounter = 0
                timeStep()
            }
            
            if _population == 0 {
                
            }
        }
        _prevTime = currentTime
    }
    
    func timeStep()
    {
        countLivingNeighbors()
        updateCreatures()
        _generation+=1
    }
    
    func countLivingNeighbors()
    {
        for r in 0..<_numRows {
            for c in 0..<_numCols
            {
                var numLivingNeighbors:Int = 0
                for i in (r-1)...(r+1) {
                    for j in (c-1)...(c+1)
                    {
                        if ( !((r == i) && (c == j)) && isValidTile(row: i, column: j)) {
                            if _tiles[i][j].isAlive {
                                numLivingNeighbors+=1
                            }
                        }
                    }
                }
                _tiles[r][c].numLivingNeighbors = numLivingNeighbors
            }
        }
    }
    
    func updateCreatures()
    {
        var numAlive = 0
        for r in 0..<_numRows {
            for c in 0..<_numCols
            {
                let tile:Tile = _tiles[r][c]
                if tile.numLivingNeighbors == 3 {
                    tile.isAlive = true
                } else if tile.numLivingNeighbors < 2 || tile.numLivingNeighbors > 3 {
                    // run random
                    var isAlive:Bool = false;
                    
                    if (tile.isAlive) {
                        switch (tile.numLivingNeighbors) {
                        case 0:
                            isAlive = isCreatureMustAlive(_chanceDieWith0Neighbours);
                            break;
                        case 1:
                            isAlive = isCreatureMustAlive(_chanceDieWith1Neighbours);
                            break;
                        case 4:
                            isAlive = isCreatureMustAlive(_chanceDieWith4Neighbours)
                            break;
                        case 5:
                            isAlive = isCreatureMustAlive(_chanceDieWith5Neighbours)
                            break;
                        case 6:
                            isAlive = isCreatureMustAlive(_chanceDieWith6Neighbours)
                            break;
                        case 7:
                            isAlive = isCreatureMustAlive(_chanceDieWith7Neighbours)
                            break;
                        case 8:
                            isAlive = isCreatureMustAlive(_chanceDieWith8Neighbours)
                            break;
                        default:
                            isAlive = false
                            break;
                        }
                    }
                    tile.isAlive = isAlive
                }
                if tile.isAlive {
                    numAlive+=1
                }
            }
        }
        _population = numAlive
    }
    
    /* calculate how big each tile should be,
     based on the total grid size and the number of tiles
     in the grid */
    func calculateTileSize() -> CGSize
    {
        let tileWidth = _gridWidth / _numCols - _margin
        let tileHeight = _gridHeight / _numRows - _margin
        return CGSize(width: tileWidth, height: tileHeight)
    }
    
    func getTilePosition(row r:Int, column c:Int) -> CGPoint
    {
        let tileSize = calculateTileSize()
        let x = Int(_gridLowerLeftCorner.x) + _margin + (c * (Int(tileSize.width) + _margin))
        let y = Int(_gridLowerLeftCorner.y) + _margin + (r * (Int(tileSize.height) + _margin))
        return CGPoint(x: x, y: y)
    }
    
    func isValidTile(row r: Int, column c:Int) -> Bool {
        return r >= 0 && r < _numRows && c >= 0 && c < _numCols
    }
    
    func getTileAtPosition(xPos x: Int, yPos y: Int) -> Tile? {
        let r:Int = Int( CGFloat(y - (Int(_gridLowerLeftCorner.y) + _margin)) / CGFloat(_gridHeight) * CGFloat(_numRows))
        let c:Int = Int( CGFloat(x - (Int(_gridLowerLeftCorner.x) + _margin)) / CGFloat(_gridWidth) * CGFloat(_numCols))
        if isValidTile(row: r, column: c) {
            return _tiles[r][c]
        } else {
            return nil
        }
    }
    
    func isCreatureMustAlive (_ chanceDie: Int) -> Bool {
        return chanceDie <= Int(arc4random_uniform(UInt32(100 - 0 + 1)))
    }
}
