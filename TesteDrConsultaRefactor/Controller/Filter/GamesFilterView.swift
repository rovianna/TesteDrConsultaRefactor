//
//  GamesFilterView.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 01/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

/* Yup, I should be using global variables. */
protocol GameFilterViewDelegate {
    func confirmFilter(currentGames: Int)
}

class GamesFilterView: UIView {
    
    var delegate: GameFilterViewDelegate?
    var currentGamesValue = 25 {
        didSet {
            gamesCountLabel.text = "\(currentGamesValue)"
        }
    }
    
    let gamesCountLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let segmentedItems = ["Nome", "Ranking"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let quantitySlider = UISlider()
        quantitySlider.maximumValue = 100
        quantitySlider.minimumValue = 1
        let confirmButtonAction = UIButton()
        segmentedControl.addTarget(self, action: #selector(filteredMethod(_:)), for: .valueChanged)
        quantitySlider.addTarget(self, action: #selector(quantityItem(_:)), for: .valueChanged)
        confirmButtonAction.addTarget(self, action: #selector(confirmFilteredAction(_:)), for: .touchUpInside)
    }
    
    @objc func filteredMethod(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 1: break
        default: break
        }
    }
    
    @objc func quantityItem(_ sender: UISlider){
        currentGamesValue = Int(sender.value)
    }
    
    @objc func confirmFilteredAction(_ sender: UIButton){
        delegate?.confirmFilter(currentGames: currentGamesValue)
        self.removeFromSuperview()
    }
    
}
