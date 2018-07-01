//
//  GameFilterViewController.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 01/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class GameFilterViewController: UIViewController {
    
    let gamesTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Games"
        let filterButton = UIBarButtonItem(image: #imageLiteral(resourceName: "iconFilter"), style: .plain, target: self, action: #selector(showFilterView(_:)))
        self.navigationItem.rightBarButtonItem = filterButton
        gamesTableView.backgroundColor = UIColor.twitchPurple
        self.view.addSubview(gamesTableView)
        gamesTableView.translatesAutoresizingMaskIntoConstraints = false
        gamesTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        gamesTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        gamesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        gamesTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        gamesTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        gamesTableView.dataSource = self
        gamesTableView.delegate = self
    }
    
    @objc func showFilterView(_ sender: UIBarButtonItem){
        let view = GamesFilterView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        view.backgroundColor = UIColor.twitchPurple
        UIView.animate(withDuration: 0.3) {
            self.view.addSubview(view)
            self.view.bringSubview(toFront: view)
        }
    }
}

extension GameFilterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = GamesTableViewCell(style: .default, reuseIdentifier: "gameCell")
        cell.configure(game: "Game of Thrones", viewers: 1000, position: 1)
        return cell
    }
    
    
}
