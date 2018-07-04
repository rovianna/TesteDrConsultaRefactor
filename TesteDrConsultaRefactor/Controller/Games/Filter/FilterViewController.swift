//
//  FilterViewController.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 04/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var quantitySelectedLabel: UILabel!
    var quantitySlider : Int = 25 {
        didSet {
            quantitySelectedLabel.text = "\(quantitySlider)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func filterSegmentedControl(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func quantitySliderAction(_ sender: UISlider) {
        quantitySlider = Int(sender.value)
    }
    
    
    @IBAction func confirmFilterAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelFilterAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
