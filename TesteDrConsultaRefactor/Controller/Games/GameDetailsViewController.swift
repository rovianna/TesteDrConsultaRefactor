//
//  GameDetailsViewController.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 03/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class GameDetailsViewController: UIViewController {
    
    var gameImageDescription = UIImageView()
    var game : Game?
    var viewersLabel = UILabel()
    var popularityLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(game != nil, "A Game must be passed")
        guard let game = game else { return }
        self.navigationItem.title = "\(game.game)"
        
    }

}
