//
//  GameFilterViewController.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 01/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class GameFilterViewController: UIViewController, FilterViewControllerDelegate {
    func selected(filters: [GameFilter]) {
        self.source?.filters = filters
    }
    
    
    @IBOutlet weak var gamesTableView: UITableView!
    var games = [Game]() {
        didSet {
           receiveGames(games)
        }
    }
    let gameStoryboard = UIStoryboard.init(name: "Game", bundle: nil)
    let requester = GameRequester()
    var source: GameListDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Games"
        let filterButton = UIBarButtonItem(image: #imageLiteral(resourceName: "iconFilter"), style: .plain, target: self, action: #selector(showFilterView(_:)))
        self.navigationItem.rightBarButtonItem = filterButton
        loadGames()
    }
    
    /* There has to be another function to call the API */
    func loadGames(){
        requester.getTopGames { (response) in
            switch response {
            case .failure(let error): print("Error: \(error)")
            case .sucess(let data): self.games = data
            }
        }
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
        let filterView = gameStoryboard.instantiateViewController(withIdentifier: "filter") as! FilterViewController
        filterView.delegate = self
        self.navigationController?.present(filterView, animated: true, completion: nil)
    }
}

extension GameFilterViewController: GameListDataSourceDelegate {
    func selectedGame(selectedGame: Game) {
        let gameDetails = gameStoryboard.instantiateViewController(withIdentifier: "details") as! GameDetailsViewController
        gameDetails.game = selectedGame
        self.navigationController?.show(gameDetails, sender: nil)
    }
}
