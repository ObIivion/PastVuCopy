//
//  PhotoAnnotationView.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 26.04.2023.
//

import UIKit
import Kingfisher
import MapKit

class PhotoAnnotationView: MKAnnotationView {
    
    private let imageView = UIImageView()
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        awakeFromNib()
        fatalError()
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setPhoto(url: URL) {
        imageView.kf.setImage(with: url)
    }
    
}
