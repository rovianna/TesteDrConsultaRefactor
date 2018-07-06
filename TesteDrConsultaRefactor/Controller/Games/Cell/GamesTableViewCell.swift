//
//  GamesTableViewCell.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 01/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class GamesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var viewersLabel: UILabel!
 
    func configure(game: Game){
        gameTitleLabel.text = game.game
        positionLabel.text = "#\(game.position)"
        viewersLabel.text = "\(game.viewers)"
        logoImageView.downloadImage(from: game.image)
    }
    
}
