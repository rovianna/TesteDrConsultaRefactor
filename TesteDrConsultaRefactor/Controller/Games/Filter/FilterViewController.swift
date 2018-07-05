//
//  FilterViewController.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 04/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

protocol GameFilter {
    func apply(filters: [Game]) -> [Game]
}

protocol FilterViewControllerDelegate {
    func selected(filters: [GameFilter])
}

class GameSort : GameFilter {
    var sortBy: Int
    
    init(sortBy: Int) {
        self.sortBy = sortBy
    }
    
    func apply(filters: [Game]) -> [Game] {
        switch sortBy {
        case 1: return sortByName(games: filters)
        default: return sortByPosition(games: filters)
        }
    }
    
    func sortByPosition(games: [Game]) -> [Game] {
        var gamesFilter = games
        gamesFilter.sort(by: {left, right in
            return left.position < right.position
        })
        return gamesFilter
    }
    
    func sortByName(games: [Game]) -> [Game] {
        var gamesFilter = games
        gamesFilter.sort(by: {left, right in
            let game1 = left.game
            let game2 = right.game
            let compare = game1.localizedCompare(game2) == .orderedAscending
            return compare
        })
        return gamesFilter
    }
    
}

class FilterViewController: UIViewController {
    
    
    @IBOutlet weak var toFilterSegmentedControl: UISegmentedControl!
    @IBOutlet weak var quantitySelectedLabel: UILabel!
    var quantitySlider : Int = 25 {
        didSet {
            quantitySelectedLabel.text = "\(quantitySlider)"
        }
    }
    
    var delegate: FilterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func quantitySliderAction(_ sender: UISlider) {
        quantitySlider = Int(sender.value)
    }
    
    
    @IBAction func confirmFilterAction(_ sender: UIButton) {
        var filter = [GameFilter]()
        let gameSort = GameSort(sortBy: toFilterSegmentedControl.selectedSegmentIndex)
        filter.append(gameSort)
        delegate?.selected(filters: filter)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelFilterAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
