//
//  MapFilter.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 28.04.2023.
//

import Foundation
import MapKit

struct MapFilter {
    let year1: Int
    let year2: Int
    let region: MKCoordinateRegion
    let zoomLevel: Int
    
    var polyon: [[[Double]]] {
        
        let minX = region.center.latitude - region.span.latitudeDelta
        let maxX = region.center.latitude + region.span.latitudeDelta * 0.7
        
        let minY = region.center.longitude - region.span.longitudeDelta
        let maxY = region.center.longitude + region.span.longitudeDelta * 0.7
        
        let topLeft: [Double] = [minX, minY].reversed()
        let topRight: [Double] = [maxX, minY].reversed()
        let botLeft: [Double] = [minX, maxY].reversed()
        let botRight: [Double] = [maxX, maxY].reversed()
        
        return [[topLeft, botLeft, botRight, topRight]]
    }
    
    
    
}
