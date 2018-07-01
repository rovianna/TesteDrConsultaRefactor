//
//  Game.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 01/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class Game {
    var game: String
    var image: String
    var position: String
    var viewers: String
    
    init(game: String, image: String, position: String, viewers: String) {
        self.game = game
        self.image = image
        self.position = position
        self.viewers = viewers
    }
}
