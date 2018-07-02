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
            gamesCountLabel.text = "Quantidade de Games: \(currentGamesValue)"
        }
    }
    
    let gamesCountLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let segmentedItems = ["Nome", "Ranking"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let quantitySlider = UISlider()
        let segmentedFilterChoice = UILabel()
        quantitySlider.maximumValue = 100
        quantitySlider.minimumValue = 1
        let confirmButtonAction = UIButton()
        segmentedControl.addTarget(self, action: #selector(filteredMethod(_:)), for: .valueChanged)
        quantitySlider.addTarget(self, action: #selector(quantityItem(_:)), for: .valueChanged)
        confirmButtonAction.addTarget(self, action: #selector(confirmFilteredAction(_:)), for: .touchUpInside)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        quantitySlider.translatesAutoresizingMaskIntoConstraints = false
        quantitySlider.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        confirmButtonAction.translatesAutoresizingMaskIntoConstraints = false
        confirmButtonAction.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        gamesCountLabel.translatesAutoresizingMaskIntoConstraints = false
        gamesCountLabel.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        segmentedFilterChoice.translatesAutoresizingMaskIntoConstraints = false
        segmentedFilterChoice.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(segmentedControl)
        addSubview(quantitySlider)
        addSubview(confirmButtonAction)
        addSubview(gamesCountLabel)
        addSubview(segmentedFilterChoice)
        segmentedFilterChoice.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        quantitySlider.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 200).isActive = true
        quantitySlider.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150).isActive = true
        segmentedFilterChoice.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -24).isActive = true
        segmentedFilterChoice.heightAnchor.constraint(equalToConstant: 20).isActive = true
        segmentedFilterChoice.widthAnchor.constraint(equalToConstant: 300).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        quantitySlider.heightAnchor.constraint(equalToConstant: 40).isActive = true
        quantitySlider.widthAnchor.constraint(equalToConstant: 300).isActive = true
        confirmButtonAction.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        confirmButtonAction.widthAnchor.constraint(equalToConstant: 300).isActive = true
        confirmButtonAction.topAnchor.constraint(equalTo: quantitySlider.bottomAnchor, constant: 48).isActive = true
        confirmButtonAction.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48).isActive = true
        gamesCountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        gamesCountLabel.bottomAnchor.constraint(equalTo: quantitySlider.topAnchor, constant: -24).isActive = true
        gamesCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        gamesCountLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        gamesCountLabel.text = "Quantidade de Games: \(currentGamesValue)"
        segmentedFilterChoice.text = "Filtrar por:"
        segmentedFilterChoice.textColor = UIColor.white
        gamesCountLabel.textAlignment = .center
        confirmButtonAction.setTitle("Confirmar", for: .normal)
        confirmButtonAction.setTitleColor(UIColor.twitchPurple, for: .normal)
        confirmButtonAction.backgroundColor = UIColor.white
        confirmButtonAction.layer.cornerRadius = 20
        segmentedControl.tintColor = UIColor.white
        gamesCountLabel.textColor = UIColor.white
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
