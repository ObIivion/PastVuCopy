//
//  BaseButton.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import UIKit

class BaseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    func initSetup() {
        // override on subclasses
    }
    
}
