//
//  GameListDataSource.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 02/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

/* LET'S DO THIS */

protocol GameListDataSourceDelegate {
    func selectedGame(selectedGame: Game)
}

import UIKit

class GameListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
 
    weak var tableView: UITableView?
    
    /* And here's the array! */
    var filters : [GameFilter]? {
        didSet {
            popularGames = filterGames(data: popularGames)
        }
    }
    var popularGames = [Game]() {
        didSet {
            onMain {
                 self.tableView?.reloadData()
            }
        }
    }
    var delegate: GameListDataSourceDelegate?
    init(tableView: UITableView, games: [Game]){
        super.init()
        
        for (i, game) in games.enumerated() {
            game.position = i + 1
        }
        self.popularGames = games
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
    }
    
    func filterGames(data: [Game]) -> [Game] {
        var gamesToFilter = data
        if let filters = filters {
            for filter in filters {
                gamesToFilter = filter.apply(filters: gamesToFilter)
            }
        }
        return gamesToFilter
    }
    
    /* The idea is to execute the "block" on the main thread, UI Stuff */
    func onMain(block: @escaping ()->()){
        DispatchQueue.main.async {
            block()
        }
    }
    
    //MARK: Source it up!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nib = UINib(nibName: "GamesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        let game = popularGames[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        cell.selectionStyle = .none
        cell.configure(game: game)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedGame(selectedGame: popularGames[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GamesTableViewCell
        return cell.frame.size.height
    }
}
