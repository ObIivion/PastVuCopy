//
//  YearSelectorControl.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 28.04.2023.
//

import UIKit

class YearSelectorControl: BaseView {
    
    private let gradientLayer = CAGradientLayer()
    private let yearsGradientView = UIView()
    
    private let topThumb = YearSelectorThumb()
    private let botThumb = YearSelectorThumb()
    
    override func initSetup() {
        super.initSetup()
        
        addSubview(yearsGradientView)
        addSubview(topThumb)
        addSubview(botThumb)
        
        setupConstraints()
        setupGradient()
        
        let topPanGesture = UIPanGestureRecognizer(target: self, action: #selector(topPanGesture(_:)))
        let botPanGesture = UIPanGestureRecognizer(target: self, action: #selector(botPanGesture(_:)))
        topThumb.addGestureRecognizer(topPanGesture)
        botThumb.addGestureRecognizer(botPanGesture)
        
        topThumb.mode = .top
        botThumb.mode = .bot
        
        //yearsGradientView.backgroundColor = .blue
        topThumb.backgroundColor = .brown
        botThumb.backgroundColor = .orange
    }
    
    @objc private func topPanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        switch gestureRecognizer.state {
        case .began: break;
        case .changed:
            let translation = gestureRecognizer.translation(in: self)
            let newX = topThumb.center.x
            let newY = topThumb.center.y + translation.y
            topThumb.center = CGPoint(x: newX, y: newY)
            gestureRecognizer.setTranslation(.zero, in: self)
        case .ended:
            let translation = gestureRecognizer.translation(in: self)
            let newMaxY = topThumb.frame.maxY + translation.y
            
            if (newMaxY < yearsGradientView.frame.minY) {
                topThumb.center = CGPoint(x: topThumb.center.x, y: yearsGradientView.frame.origin.y - topThumb.frame.size.height / 2)
                print(#function, "Улетело выше")
                gestureRecognizer.setTranslation(.zero, in: self)
            }
            
            if (newMaxY > yearsGradientView.center.y) {
                print(#function, "Улетело ниже")
                topThumb.center = CGPoint(x: topThumb.center.x, y: yearsGradientView.center.y - topThumb.frame.size.height / 2)
            }
            
        case .cancelled:
            gestureRecognizer.setTranslation(.zero, in: self.superview)
        case .possible: break;
        case .failed:
            gestureRecognizer.setTranslation(.zero, in: self.superview)
        @unknown default: break
        }
    }
    
    @objc private func botPanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        switch gestureRecognizer.state {
        case .began: break;
        case .changed:
            let translation = gestureRecognizer.translation(in: self)
            let newX = botThumb.center.x
            let newY = botThumb.center.y + translation.y
            botThumb.center = CGPoint(x: newX, y: newY)
            gestureRecognizer.setTranslation(.zero, in: self)
        case .ended:
            let translation = gestureRecognizer.translation(in: self)
            let newMinY = botThumb.frame.minY + translation.y
            
            if (newMinY > yearsGradientView.frame.minY) {
                botThumb.center = CGPoint(x: botThumb.center.x, y: yearsGradientView.frame.maxY + botThumb.frame.size.height / 2)
                print(#function, "Улетело ниже")
                gestureRecognizer.setTranslation(.zero, in: self)
            }
            
            if (newMinY < yearsGradientView.center.y) {
                print(#function, "Улетело выше")
                botThumb.center = CGPoint(x: botThumb.center.x, y: yearsGradientView.center.y + botThumb.frame.size.height / 2)
            }
            
        case .cancelled:
            gestureRecognizer.setTranslation(.zero, in: self.superview)
        case .possible: break;
        case .failed:
            gestureRecognizer.setTranslation(.zero, in: self.superview)
        @unknown default: break
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        yearsGradientView.layer.cornerRadius = yearsGradientView.frame.width / 2
        gradientLayer.cornerRadius = yearsGradientView.frame.width / 2
        gradientLayer.frame = yearsGradientView.bounds
        
        print(#function, yearsGradientView.frame)
        print(#function, topThumb.frame)
        print(#function, botThumb.frame)
    }
    
    private func setupConstraints() {
        
        let topOffset = topThumb.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        let botOffset = botThumb.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        
        yearsGradientView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yearsGradientView.topAnchor.constraint(equalTo: topAnchor, constant: topOffset),
            yearsGradientView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -botOffset),
            yearsGradientView.rightAnchor.constraint(equalTo: rightAnchor),
            yearsGradientView.widthAnchor.constraint(equalToConstant: 7),
            yearsGradientView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        topThumb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topThumb.topAnchor.constraint(equalTo: topAnchor),
            topThumb.rightAnchor.constraint(equalTo: yearsGradientView.leftAnchor),
            topThumb.leftAnchor.constraint(equalTo: leftAnchor),
            topThumb.widthAnchor.constraint(equalToConstant: 54),
        ])
        
        botThumb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            botThumb.leftAnchor.constraint(equalTo: leftAnchor),
            botThumb.rightAnchor.constraint(equalTo: yearsGradientView.leftAnchor),
            botThumb.topAnchor.constraint(equalTo: yearsGradientView.bottomAnchor),
            botThumb.widthAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    private func setupGradient() {
        gradientLayer.colors = [
            UIColor(red: 0.725, green: 0.833, blue: 0.476, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.8, blue: 0.092, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.459, blue: 0.229, alpha: 1).cgColor,
            UIColor(red: 0.941, green: 0.314, blue: 0.325, alpha: 1).cgColor,
        ]
        
        gradientLayer.locations = [0, 0.34, 0.66, 1]
        gradientLayer.masksToBounds = false
        yearsGradientView.layer.addSublayer(gradientLayer)
    }
}
