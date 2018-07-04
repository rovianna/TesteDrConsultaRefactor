//
//  GameListDataSource.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 02/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

/* LET'S DO THIS */

import UIKit

class GameListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
 
    weak var tableView: UITableView?
    
    /* And here's the array! */
    var popularGames = [Game]()
    
    init(tableView: UITableView, games: [Game]){
        super.init()
        self.popularGames = games
            tableView.delegate = self
            tableView.dataSource = self
        self.tableView = tableView
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
        cell.configure(game: game)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GamesTableViewCell
        return cell.frame.size.height
    }
    
    
}
