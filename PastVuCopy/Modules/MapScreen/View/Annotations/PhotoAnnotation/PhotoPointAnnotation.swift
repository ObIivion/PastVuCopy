//
//  PhotoPointAnnotation.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 26.04.2023.
//

import Foundation
import MapKit

class PhotoPointAnnotation: MKPointAnnotation {
    let id: Int
    let photoUrl: URL
    
    init(id: Int, photoUrl: URL) {
        self.id = id
        self.photoUrl = photoUrl
    }
}
