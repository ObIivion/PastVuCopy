//
//  PageControllerView.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 06.04.2023.
//

import UIKit
import RswiftResources

class PageControllerView: BaseView {
    
    let arrowButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(R.image.mB(), for: .normal)
        button.scalesLargeContentImage = true
        return button
    }()
    
    private let testMapButton = BluredButton(frame: .init(x: 400, y: 400, width: 30, height: 30))
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor(red: 1, green: 0.459, blue: 0.229, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor(red: 0.729, green: 0.661, blue: 0.632, alpha: 1)
        return pageControl
    }()
    
    override func initSetup() {
        backgroundColor = .clear
        
        addSubview(arrowButton)
        addSubview(pageControl)
        addSubview(testMapButton)
        
        setupContraints()
    }
    
    override func layoutSubviews() {
        pageControl.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }

    private func setupContraints() {
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            arrowButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -142),
            arrowButton.widthAnchor.constraint(equalToConstant: 100),
            arrowButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
        ])
    }
}






//   private func setupShadows() {
//        arrowButton.layer.shadowColor = UIColor(red: 1, green: 0.587, blue: 0.288, alpha: 0.6).cgColor
//        arrowButton.layer.shadowOpacity = 1
//        arrowButton.layer.shadowOffset = CGSize(width: 0, height: 5)
//    }
//
//    private func setupGradient() {
//
//        gradientLayer.colors = [
//          UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor,
//          UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor
//        ]
//        gradientLayer.locations = [0, 1]
//        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 0.6, y: 0.5)
//        gradientLayer.position = arrowButton.center
//        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.62, b: 2.38, c: -2.38, d: 1.62, tx: 0.43, ty: -2.29))
//        arrowButton.layer.addSublayer(gradientLayer)
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        arrowButton.layer.shadowRadius = 14
//        arrowButton.layer.cornerRadius = arrowButton.bounds.width / 2
//        gradientLayer.frame = arrowButton.bounds.insetBy(dx: -1.5 * arrowButton.bounds.size.width, dy: -1.5 * arrowButton.bounds.size.height)
//
//        print(arrowButton.bounds)
//        print(gradientLayer.bounds)
//
//    }
//
