//
//  GameFilterViewController.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 01/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class GameFilterViewController: UIViewController {
    

    @IBOutlet weak var gamesTableView: UITableView!
            var games = [Game(game: "Game of Thrones", image: "lala", position: 1, viewers: 10000)]
    var source: GameListDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Games"
        let filterButton = UIBarButtonItem(image: #imageLiteral(resourceName: "iconFilter"), style: .plain, target: self, action: #selector(showFilterView(_:)))
        self.navigationItem.rightBarButtonItem = filterButton
        source = GameListDataSource(tableView: gamesTableView, games: games)
        gamesTableView.reloadData()
    }
    
    @IBAction func showFilterView(_ sender: Any) {

    }
}
