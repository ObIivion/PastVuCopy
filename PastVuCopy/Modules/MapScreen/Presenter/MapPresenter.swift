//
//  MapViewModel.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 11.04.2023.
//

import Foundation
import UIKit

protocol MapOutput {
    func getUserRegion()
    func getClustersAndPhotos()
}

class MapPresenter {
    
    private let locationService = LocationService()
    private let apiProvider = ApiProvider()
    
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
    
    func getClustersAndPhotos() {
        apiProvider.getPhotosAndClusters()
    }
    
}
