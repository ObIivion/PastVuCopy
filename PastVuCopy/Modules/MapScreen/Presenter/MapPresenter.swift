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
        
        switch photoByBoundsModel {
        case let .success(photo):
            let annotations = makePointAnnotations(model: photo)
            DispatchQueue.main.async {
                self.view?.setAnnotations(annotations: annotations)
            }
        case .failure(_):
            break
        }
        
    }
    
    func makePointAnnotations(model: PhotoByBoundsModel) -> [MKPointAnnotation] {
        
        var annotations: [MKPointAnnotation] = []
        
        model.result?.photos.forEach({
            let photoUrl = Constants.baseImageUrl.appendingPathComponent($0.file)
            let photoPointAnnotation = PhotoPointAnnotation(id: $0.cid, photoUrl: photoUrl)
            photoPointAnnotation.coordinate = CLLocationCoordinate2D(latitude: $0.geo[0], longitude: $0.geo[1])
            annotations.append(photoPointAnnotation)
        })
        
        model.result?.clusters?.forEach({
            if let photo = $0.p {
                let clusterPointAnnotation = ClusterPointAnnotation(id: photo.cid, count: $0.c)
                clusterPointAnnotation.coordinate = CLLocationCoordinate2D(latitude: $0.geo[0], longitude: $0.geo[1])
                annotations.append(clusterPointAnnotation)
            }
        })
        
        return annotations
    }
}
