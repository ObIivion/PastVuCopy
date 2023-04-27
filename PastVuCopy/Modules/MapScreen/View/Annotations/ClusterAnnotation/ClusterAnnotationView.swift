//
//  ClusterAnnotationView.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 26.04.2023.
//

import Foundation
import UIKit
import RswiftResources
import MapKit

class ClusterAnnotationView: MKAnnotationView {
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.montserratAlternatesSemiBold(size: 13)
        label.textColor = UIColor(red: 0.267, green: 0.173, blue: 0.133, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 0.892, green: 0.877, blue: 0.855, alpha: 0.4)
        addSubview(countLabel)
        countLabel.backgroundColor = .gray
        countLabel.layer.cornerRadius = 17
        countLabel.layer.masksToBounds = true
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        awakeFromNib()
        fatalError()
    }
    
    private func setupConstraints() {
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            countLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: 50),
            countLabel.heightAnchor.constraint(equalTo: heightAnchor, constant: 50)
        ])
    }
    
    func setCount(_ count: Int) {
        countLabel.text = String(count)
    }
    
}
