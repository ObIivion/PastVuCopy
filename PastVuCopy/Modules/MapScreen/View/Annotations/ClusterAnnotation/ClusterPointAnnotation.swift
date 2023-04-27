//
//  ClusterPointAnnotation.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 26.04.2023.
//

import Foundation
import MapKit

class ClusterPointAnnotation: MKPointAnnotation {
    let id: Int
    let count: Int
    
    init(id: Int, count: Int) {
        self.id = id
        self.count = count
    }
}
