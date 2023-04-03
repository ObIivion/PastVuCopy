//
//  ImageButton.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import UIKit

class ImageButton: UIButton {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 76, height: 76)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        awakeFromNib()
    }
    
    private func initSetup() {
        setImage(UIImage(named: "RightArrow"), for: .normal)
        setupShadow()
    }
    
    private func setupShadow() {
        layer.shadowColor = UIColor(red: 1, green: 0.587, blue: 0.288, alpha: 0.6).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = bounds.width/2
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
}
