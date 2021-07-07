//
//  HeaderView.swift
//  ContainerApp
//
//  Created by Madhusudhan Reddy Putta on 02/07/21.
//

import UIKit

protocol HeaderViewDelegate {
    func menuTapped()
    func profleTapped()
}

class HeaderView: UIView {

    var delegate : HeaderViewDelegate!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension HeaderView {
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        delegate.menuTapped()
    }
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        delegate.profleTapped()
    }
    
}

