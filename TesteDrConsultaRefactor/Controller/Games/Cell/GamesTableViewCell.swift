//
//  GamesTableViewCell.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 01/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class GamesTableViewCell: UITableViewCell {

    var thumbnailImageView: UIImageView!
    var gameDescriptionLabel: UILabel!
    var positionLabel: UILabel!
    var viewersLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.twitchPurple
        selectionStyle = .none
        
        positionLabel = UILabel()
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(positionLabel)
        
        positionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        
        positionLabel.textColor = UIColor.white
        
        thumbnailImageView = UIImageView()
        addSubview(thumbnailImageView)
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        thumbnailImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        thumbnailImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        thumbnailImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        thumbnailImageView.image = #imageLiteral(resourceName: "iconFilter")
        
        gameDescriptionLabel = UILabel()
        addSubview(gameDescriptionLabel)
        gameDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        gameDescriptionLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        gameDescriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 16).isActive = true
        gameDescriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        gameDescriptionLabel.leftAnchor.constraint(equalTo: thumbnailImageView.rightAnchor, constant: 16).isActive = true
        gameDescriptionLabel.textColor = UIColor.white
        
        positionLabel.topAnchor.constraint(equalTo: gameDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        
        viewersLabel = UILabel()
        viewersLabel.translatesAutoresizingMaskIntoConstraints = false
        viewersLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(viewersLabel)
        viewersLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        viewersLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true
        gameDescriptionLabel.bottomAnchor.constraint(equalTo: viewersLabel.topAnchor, constant: -16).isActive = true
        positionLabel.rightAnchor.constraint(equalTo: viewersLabel.leftAnchor, constant: -16).isActive = true
        viewersLabel.textColor = UIColor.white
    }
    
    func configure(game: String, viewers: Int, position: Int){
        gameDescriptionLabel.text = game
        viewersLabel.text = "\(viewers)"
        positionLabel.text = "#\(position)"
    }
}
