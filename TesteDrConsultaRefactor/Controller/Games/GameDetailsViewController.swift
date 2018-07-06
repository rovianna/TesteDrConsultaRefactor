//
//  GameDetailsViewController.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 03/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class GameDetailsViewController: UIViewController {
    
    var game : Game?
    
    @IBOutlet weak var gameDetailImageView: UIImageView!
    @IBOutlet weak var viewersDetailLabel: UILabel!
    @IBOutlet weak var positionDetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(game != nil, "A Game must be passed")
        guard let game = game else { return }
        self.navigationItem.title = "\(game.game)"
        gameDetailImageView.downloadImage(from: game.bigImage)
        viewersDetailLabel.text = "\(game.viewers)"
        positionDetailLabel.text = "#\(game.position)"
    }

}
