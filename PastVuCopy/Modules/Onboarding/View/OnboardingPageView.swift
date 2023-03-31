//
//  OnboardingPageView.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import UIKit

class OnboardingPageView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.267, green: 0.173, blue: 0.133, alpha: 1)
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.729, green: 0.661, blue: 0.632, alpha: 1)
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let vectorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func initSetup() {
        addSubview(titleLabel)
        addSubview(textLabel)
        addSubview(vectorImageView)
        addSubview(imageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 73),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -14)
        ])
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: topAnchor, constant: 120),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        vectorImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vectorImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -23),
            vectorImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setData(model: OnboardingPageModel) {
        titleLabel.text = model.title
        textLabel.text = model.text
        imageView.image = model.image
        vectorImageView.image = model.vectorImage
    }

}
