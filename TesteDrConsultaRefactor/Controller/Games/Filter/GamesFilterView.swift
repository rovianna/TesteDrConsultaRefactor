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
    
    class var instance: GamesFilterView {
        let nib = UINib(nibName: "GamesFilterView", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! GamesFilterView
        return view
    }
    
    var delegate: GameFilterViewDelegate?
    var currentGamesValue = 25 {
        didSet {
            gamesCountLabel.text = "\(currentGamesValue)"
        }
    }
    
    let gamesCountLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let segmentedItems = ["Nome", "Ranking"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let quantitySlider = UISlider()
        quantitySlider.maximumValue = 100
        quantitySlider.minimumValue = 1
        let confirmButtonAction = UIButton()
        segmentedControl.addTarget(self, action: #selector(filteredMethod(_:)), for: .valueChanged)
        quantitySlider.addTarget(self, action: #selector(quantityItem(_:)), for: .valueChanged)
        confirmButtonAction.addTarget(self, action: #selector(confirmFilteredAction(_:)), for: .touchUpInside)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        quantitySlider.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        quantitySlider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(segmentedControl)
        addSubview(quantitySlider)
        segmentedControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        segmentedControl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        segmentedControl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        quantitySlider.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        quantitySlider.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        quantitySlider.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: -16).isActive = true
        quantitySlider.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
