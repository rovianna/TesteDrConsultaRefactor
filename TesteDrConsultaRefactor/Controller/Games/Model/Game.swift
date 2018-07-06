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
    var thumbnailImage: String
    var bigImage: String
    var position: Int
    var viewers: Int
    
    init(game: String, thumnailImage: String, bigImage: String, position: Int, viewers: Int) {
        self.game = game
        self.thumbnailImage = thumnailImage
        self.bigImage = bigImage
        self.position = position
        self.viewers = viewers
    }
    
    init(withJson json: JSON){
        self.game = json["game"]["name"].stringValue
        self.position = json["viewers"].intValue
        self.thumbnailImage = json["game"]["box"]["small"].stringValue
        self.bigImage = json["game"]["box"]["large"].stringValue
        self.viewers = json["viewers"].intValue
    }
}
