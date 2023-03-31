//
//  ImageButton.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import UIKit

class ImageButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        awakeFromNib()
    }
    
    private func initSetup() {
        //setImage(T##image: UIImage?##UIImage?, for: T##UIControl.State)
    }
    
    private func setupShadow() {
        layer.shadowColor = UIColor(red: 1, green: 0.587, blue: 0.288, alpha: 0.6).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 14
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
}
