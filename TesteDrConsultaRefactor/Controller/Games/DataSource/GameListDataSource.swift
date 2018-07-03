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
    
    /* So, this is where I'll request the API */
    
    /* And here's the array! */
    var popularGames = [Game]()
    
    init(tableView: UITableView){
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
    }
    
    /* The idea is to execute the "block" on the main thread */
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
        let cell = GamesTableViewCell(style: .default, reuseIdentifier: "gameCell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
