//
//  YearSelecterView.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 26.04.2023.
//

import UIKit

class YearSelecterView: BaseView {
    
    enum Mode {
        case top
        case bot
        
        var image: UIImage? {
            switch self {
            case .top: return R.image.topYearSelector()
            case .bot: return R.image.botYearSelector()
                
            }
        }
        
        var colorOfText: UIColor {
            switch self {
            case .top: return UIColor(red: 0.725, green: 0.831, blue: 0.475, alpha: 1)
            case .bot: return UIColor(red: 0.941, green: 0.314, blue: 0.325, alpha: 1)
            }
        }
    }
    
    var mode: Mode = .top {
        didSet {
            maskImageView.image = mode.image
            label.textColor = mode.colorOfText
        }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = R.font.montserratAlternatesMedium(size: 13)
        label.numberOfLines = 2
        return label
    }()
    
    private let maskImageView = UIImageView()
    
    override func initSetup() {
        addSubview(label)
        setupConstraints()
        
        maskImageView.contentMode = .scaleAspectFit
        mask = maskImageView
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        maskImageView.frame = bounds
    }
    
    func setValue(_ value: Double) {
        let text = String(format: "%.4i", Int(value))
        label.text = text.splitedBy(length: 2).joined(separator: "\n")
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17)
        ])
    }

}
