//
//  MapView.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 10.04.2023.
//

import Foundation
import UIKit
import MapKit

class MapView: BaseView {
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.showsUserLocation = true
        return map
    }()
    
    let plusButton: BluredButton = {
        let button = BluredButton()
        button.setImage(R.image.plus(), for: .normal)
        return button
    }()
    
    let minusButton: BluredButton = {
        let button = BluredButton()
        button.setImage(R.image.minus(), for: .normal)
        return button
    }()
    
    let profileButton: BluredButton = {
        let button = BluredButton()
        button.setImage(R.image.profile(), for: .normal)
        return button
    }()
    
    let favouritesButton: BluredButton = {
        let button = BluredButton()
        button.setImage(R.image.star(), for: .normal)
        return button
    }()
    
    let compassButton: BluredButton = {
        let button = BluredButton()
        button.setImage(R.image.compass(), for: .normal)
        return button
    }()
    
    private let yearsGradientView = UIView()
    
    let cameraButton: BigCircleBluredButton = {
        let button = BigCircleBluredButton()
        button.imageView?.clipsToBounds = true
        button.setImage(R.image.camera(), for: .normal)
        // костыль, но иначе пока не придумал как
        button.imageEdgeInsets = UIEdgeInsets(top: -20, left: -20, bottom: -30, right: -20)
        return button
    }()
    
    private let bottomBarLayer = CAShapeLayer()
    private let bottomBluredBar: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: effect)
        return effectView
    }()
    
    let leftBarButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(R.image.leftButtonUnselected(), for: .normal)
        button.setBackgroundImage(R.image.leftButtonSelected(), for: .highlighted)
        return button
    }()
    
    let rightBarButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(R.image.rightButtonUnselected(), for: .normal)
        button.setBackgroundImage(R.image.rightButtonSelected(), for: .highlighted)
        return button
    }()
    
    override func initSetup() {
        addSubview(mapView)
        addSubview(plusButton)
        addSubview(minusButton)
        addSubview(profileButton)
        addSubview(favouritesButton)
        addSubview(compassButton)
        addSubview(yearsGradientView)
        addSubview(bottomBluredBar)
        addSubview(cameraButton)
        
        addSubview(leftBarButton)
        addSubview(rightBarButton)
        
        setupConstraints()
    }
    
    func updateMapRegion(newRegion: MKCoordinateRegion) {
        mapView.setRegion(newRegion, animated: true)
    }
    
    private func setupConstraints() {
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            plusButton.bottomAnchor.constraint(equalTo: minusButton.topAnchor, constant: -8)
        ])
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            minusButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            minusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            minusButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 8)
        ])
        
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            profileButton.topAnchor.constraint(equalTo: topAnchor, constant: 66)
        ])
        
        favouritesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favouritesButton.topAnchor.constraint(equalTo: profileButton.topAnchor),
            favouritesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            favouritesButton.widthAnchor.constraint(equalToConstant: 48),
            favouritesButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        compassButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            compassButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            compassButton.bottomAnchor.constraint(equalTo: bottomBluredBar.topAnchor, constant: -36)
        ])
        
        yearsGradientView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yearsGradientView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            yearsGradientView.topAnchor.constraint(equalTo: favouritesButton.bottomAnchor, constant: 61),
            yearsGradientView.bottomAnchor.constraint(equalTo: bottomBluredBar.topAnchor, constant: -82),
            yearsGradientView.widthAnchor.constraint(equalToConstant: 10),
        ])
        
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cameraButton.centerYAnchor.constraint(equalTo: bottomBluredBar.topAnchor),
            cameraButton.centerXAnchor.constraint(equalTo: bottomBluredBar.centerXAnchor)
        ])
        
        bottomBluredBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomBluredBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomBluredBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomBluredBar.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        leftBarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftBarButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -47.67),
            leftBarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 68),
            leftBarButton.topAnchor.constraint(equalTo: bottomBluredBar.topAnchor, constant: 30)
        ])
        
        rightBarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightBarButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -47.67),
            rightBarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -68),
            rightBarButton.topAnchor.constraint(equalTo: bottomBluredBar.topAnchor, constant: 30)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cameraButton.layer.cornerRadius = cameraButton.bounds.width / 2
        yearsGradientView.layer.cornerRadius = 5
        drawBluredBar()
        drawGradientView()
    }
    
    private func drawGradientView() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [
            UIColor(red: 0.725, green: 0.833, blue: 0.476, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.8, blue: 0.092, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.459, blue: 0.229, alpha: 1).cgColor,
            UIColor(red: 0.941, green: 0.314, blue: 0.325, alpha: 1).cgColor,
        ]
        
        gradientLayer.locations = [0, 0.34, 0.66, 1]
        gradientLayer.frame = yearsGradientView.bounds
        gradientLayer.cornerRadius = 5
        yearsGradientView.layer.addSublayer(gradientLayer)
    }
    
    private func drawBluredBar() {
        
        let maxHeight = CGFloat(113)
        layoutIfNeeded()
        let maxWidth = bottomBluredBar.frame.width
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: maxWidth, y: maxHeight))
        path.addLine(to: CGPoint(x: 0, y: maxHeight))
        
        path.addCurve(to: CGPoint(x: maxWidth / 2 - 46, y: 0),
                      controlPoint1: CGPoint(x: 1, y: 0),
                      controlPoint2: CGPoint(x: 35, y: 10))
        
        path.addArc(withCenter: CGPoint(x: maxWidth / 2, y: 0),
                    radius: 46,
                    startAngle: CGFloat.pi,
                    endAngle: 0,
                    clockwise: false)
        
        path.addCurve(to: CGPoint(x: maxWidth, y: maxHeight),
                      controlPoint1: CGPoint(x: maxWidth - 35, y: 10),
                      controlPoint2: CGPoint(x: maxWidth - 1, y: 0))
        
        bottomBarLayer.lineWidth = 1.0
        bottomBarLayer.fillColor = UIColor.white.cgColor
        bottomBarLayer.backgroundColor = UIColor.white.cgColor
        bottomBarLayer.strokeColor = UIColor.white.cgColor
        bottomBarLayer.path = path.cgPath
        bottomBarLayer.fillRule = .evenOdd
        
        bottomBluredBar.layer.mask = bottomBarLayer
    }
}
