//
//  Tile.swift
//  Conways Game of Life
//
//  Created by Дмитрий Фещенко on 9/4/16.
//  Copyright © 2016 Dmitryi Feschenko. All rights reserved.
//

import UIKit
import SpriteKit

class Tile: SKSpriteNode {
    
    var numLivingNeighbors = 0
    
    var isAlive:Bool = false {
        didSet {
            self.isHidden = !isAlive
        }
    }
}
