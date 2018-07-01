//
//  GamesTableViewCell.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 01/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class GamesTableViewCell: UITableViewCell {

    var thumbnailImageView: UIImageView!
    var gameDescriptionLabel: UILabel!
    var positionLabel: UILabel!
    var viewersLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let gap: CGFloat = 10
        let labelHeight: CGFloat = 30
        let labelWidth: CGFloat = 150
        let lineGap: CGFloat = 5
        let label2Y: CGFloat = gap + labelHeight + lineGap
        let imageSize: CGFloat = 30
        
        gameDescriptionLabel = UILabel()
        gameDescriptionLabel.frame = CGRect(x: gap, y: gap, width: labelWidth, height: labelHeight)
        gameDescriptionLabel.textColor = UIColor.blue
        contentView.addSubview(gameDescriptionLabel)
        
        positionLabel = UILabel()
        positionLabel.frame = CGRect(x: gap, y: label2Y, width: labelWidth, height: labelHeight)
        positionLabel.textColor = UIColor.black
        contentView.addSubview(positionLabel)
        
        thumbnailImageView = UIImageView()
        thumbnailImageView.frame = CGRect(x: bounds.width - imageSize - gap, y: gap, width: imageSize, height: imageSize)
        thumbnailImageView.image = #imageLiteral(resourceName: "iconFilter")
        contentView.addSubview(thumbnailImageView)
        
        viewersLabel = UILabel()
        viewersLabel.frame = CGRect(x: bounds.width - imageSize - gap, y: label2Y, width: imageSize, height: imageSize)
        viewersLabel.textColor = UIColor.black
        contentView.addSubview(viewersLabel)
    }
    
}
