//
//  LoadingView.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 06/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    weak var widthConstraint: NSLayoutConstraint?
    
    class var instance: LoadingView {
        return fromXIB()
    }
    
    func startAnimating(){
        loading.startAnimating()
    }
    
    func stopAnimating(){
        loading.stopAnimating()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.widthAnchor.constraint(equalToConstant: 200).isActive = true
        let width = self.widthAnchor.constraint(equalToConstant: 80)
        width.priority = UILayoutPriority.fittingSizeLevel
        width.isActive = true
    }
    
    static func fromXIB() -> LoadingView {
        let nib = UINib(nibName: "LoadingView", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! LoadingView
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        view.widthAnchor.constraint(equalToConstant: 120).isActive = true
        return view
    }
    
    func show(in view: UIView){
        view.addSubview(self)
        self.center = view.center
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        show()
        layoutIfNeeded()
    }
    
    func show(){
        self.isHidden = false
        superview?.bringSubview(toFront: self)
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
    }
    
    func hide(){
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { (finished) in
            if finished {
                self.alpha = 0
                self.isHidden = true
                self.removeFromSuperview()
            }
        }
    }
}
