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
        receiveGames(games)
    }
    
    /* There has to be another function to call the API */
    func loadGames(){
//        receiveGames(loaded)
    }
    
    func receiveGames(_ games: [Game]) {
        let source = GameListDataSource(tableView: gamesTableView, games: games)
        applyDataSource(source: source)
    }
    
    func applyDataSource(source: GameListDataSource){
        source.delegate = self
        self.source = source
        gamesTableView.reloadData()
    }
    
    @IBAction func showFilterView(_ sender: Any) {
        
    }
}

extension GameFilterViewController: GameListDataSourceDelegate {
    func selectedGame(selectedGame: Game) {
        let storyboard = UIStoryboard.init(name: "Game", bundle: nil)
        let gameDetails = storyboard.instantiateViewController(withIdentifier: "details") as! GameDetailsViewController
        gameDetails.game = selectedGame
        self.navigationController?.show(gameDetails, sender: nil)
    }
}
