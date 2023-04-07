//
//  ImageButton.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import UIKit
import Rswift

class ImageButton: UIButton {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 76, height: 76)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        awakeFromNib()
        initSetup()
    }
    
    private func initSetup() {
        backgroundColor = .orange
        setupShadow()
    }
    
    private func setupShadow() {
        layer.shadowColor = UIColor(red: 1, green: 0.587, blue: 0.288, alpha: 0.6).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.masksToBounds = false
    }
    
    override func layoutSubviews() {
        layer.shadowRadius = 14
        layer.cornerRadius = bounds.width / 2
    }
    
}
