//
//  Game.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 01/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit
import SwiftyJSON

class Game {
    var game: String
    var image: String
    var position: Int
    var viewers: Int
    
    init(game: String, image: String, position: Int, viewers: Int) {
        self.game = game
        self.image = image
        self.position = position
        self.viewers = viewers
    }
    
    init(withJson json: JSON){
        self.game = json["game"].stringValue
        self.position = json["viewers"].intValue
        self.image = json["logo"]["small"].stringValue
        self.viewers = json["viewers"].intValue
    }
}
