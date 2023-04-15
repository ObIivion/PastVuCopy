//
//  MapService.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 14.04.2023.
//

import Foundation
import MapKit

final class MapService {
    
    private var currentRegion: MKCoordinateRegion?
    
    func setCurrentRegion(currentRegion: MKCoordinateRegion) {
        self.currentRegion = currentRegion
    }
    
    func getIncreasedRegion() -> MKCoordinateRegion? {
        let currentLongtitudeDelta = currentRegion?.span.longitudeDelta
        let currentLatitudeDelta = currentRegion?.span.latitudeDelta
        
        guard var baseDelta = currentLatitudeDelta else { return currentRegion }
        
        switch baseDelta {
        case 0.005...1:
            baseDelta += 0.025
        case 1...180:
            baseDelta += 5
        default:
            return currentRegion
        }
        
        guard
            let newlatitudeDelta = currentRegion?.center.latitude,
            let newLongtitudeDelta = currentRegion?.center.longitude,
            let currentCenter = currentRegion?.center
        else { return currentRegion }
        
        let newSpan = MKCoordinateSpan(latitudeDelta: newlatitudeDelta, longitudeDelta: newLongtitudeDelta)
        let newRegion = MKCoordinateRegion(center: currentCenter, span: newSpan)
        
        // должна быть проверка на максимальное приближение (0.0005) и отдаление(180), а то крашится будет
        // причём от 1 до 180 ускоряется быстрее
        return newRegion
    }
    
    func getDecreasedRegion() -> MKCoordinateRegion? {
        let currentLongtitudeDelta = currentRegion?.span.longitudeDelta
        let currentLatitudeDelta = currentRegion?.span.latitudeDelta
        
        guard var baseDelta = currentLatitudeDelta else { return currentRegion }
        
        switch baseDelta {
        case 0.025...1:
            baseDelta -= 0.025
        case 1...180:
            baseDelta -= 5
        default:
            return currentRegion
        }
        
        guard
            let newlatitudeDelta = currentRegion?.center.latitude,
            let newLongtitudeDelta = currentRegion?.center.longitude,
            let currentCenter = currentRegion?.center
        else { return currentRegion }
        
        let newSpan = MKCoordinateSpan(latitudeDelta: newlatitudeDelta, longitudeDelta: newLongtitudeDelta)
        let newRegion = MKCoordinateRegion(center: currentCenter, span: newSpan)
        
        // должна быть проверка на максимальное приближение (0.0005) и отдаление(180), а то крашится будет
        // причём от 1 до 180 ускоряется быстрее
        return newRegion
    }
}
