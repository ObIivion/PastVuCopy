//
//  MapViewModel.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 11.04.2023.
//

import Foundation
import UIKit
import MapKit

protocol MapOutput {
    func getUserRegion()
    func getPhotosByBounds(geoPolygon: [CLLocationCoordinate2D], zoomLevel: UInt) async
}

class MapPresenter {
    
    private let locationService = LocationService()
    private let asyncAwaitApiProvider = AsyncAwaitApiProvider()
    
    weak var view: MapViewInput?
    private let router: MapScreenRouter
    
    init(router: MapScreenRouter) {
        self.router = router
    }
}

extension MapPresenter: MapOutput {
    
    func getUserRegion() {
        guard let userRegion = locationService.userRegion else { return }
        view?.updateRegion(newRegion: userRegion)
    }
    
    func getPhotosByBounds(geoPolygon: [CLLocationCoordinate2D], zoomLevel: UInt) async {
        
        var polygon = [[Double]]()
        
        geoPolygon.forEach {
            polygon.append([$0.latitude, $0.longitude].reversed())
        }
        
        let finalPolygon: [[[Double]]] = [polygon]
        
        let apiTask = Task { () -> PhotoByBoundsModel in
            return try await asyncAwaitApiProvider.makeDataRequestByBounds(polygonCoordinates: finalPolygon, zoomLevel: zoomLevel)
        }
        
        let photoByBoundsModel = await apiTask.result
        
        print("PhotoByBoundsModel: @@@@@@@@@")
        dump(photoByBoundsModel)
        
    }   
}
