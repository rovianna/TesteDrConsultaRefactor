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
    var gameLabel = ""
    var viewersLabel = UILabel()
    var popularityLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\(gameLabel)"
        
        /* AutoResizing is off */
        gameImageDescription.translatesAutoresizingMaskIntoConstraints = false
        viewersLabel.translatesAutoresizingMaskIntoConstraints = false
        popularityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        gameImageDescription.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewersLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        popularityLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    
        // MARK: ImageView Constraints
        gameImageDescription.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        gameImageDescription.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        gameImageDescription.heightAnchor.constraint(equalToConstant: 100).isActive = true
        gameImageDescription.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // MARK: Viewers Label Constraints
        viewersLabel.topAnchor.constraint(equalTo: gameImageDescription.bottomAnchor, constant: 16).isActive = true
        viewersLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        viewersLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        //MARK: Popularity Label Constraints
        popularityLabel.topAnchor.constraint(equalTo: gameImageDescription.bottomAnchor, constant: 16).isActive = true
        popularityLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 16).isActive = true
        popularityLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        popularityLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //MARK: Now add the outlets to the main view
        view.addSubview(gameImageDescription)
        view.addSubview(viewersLabel)
        view.addSubview(popularityLabel)
        
        //MARK: Label properties
        viewersLabel.textColor = .white
        popularityLabel.textColor = .white
        
        viewersLabel.textAlignment = .center
        popularityLabel.textAlignment = .center
    }

}
