//
//  MapButton.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 11.04.2023.
//

import UIKit

class BluredButton: BaseButton {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 48, height: 48)
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = UIColor(red: 0.892, green: 0.877, blue: 0.855, alpha: 0.4)
            } else {
                backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
            }
        }
    }
    
    override func initSetup() {
        setupSytle()
    }
    
    private func setupSytle() {
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        setupShadows()
        addBlurEffect()
    }
    
    private func setupShadows() {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 22
        layer.shadowOffset = CGSize(width: 0, height: 18)
        layer.cornerRadius = 17
    }
    
    private func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.bounds
        
        blurView.isUserInteractionEnabled = false
        addSubview(blurView)
    }

}
