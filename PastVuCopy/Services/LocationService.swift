//
//  LocartionService.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 13.04.2023.
//

import Foundation
import MapKit
import CoreLocation

final class LocationService: NSObject {
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        manager.delegate = self
        return manager
    }()
    
    var userRegion: MKCoordinateRegion? {
        checkLocationAuthStatus()
        guard let userLocation = locationManager.location?.coordinate else { return nil }
        let userSpan = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 0.05)
        let userRegion = MKCoordinateRegion(center: userLocation, span: userSpan)
        return userRegion
    }
    
    var userLocation: CLLocation? {
        guard let userLocation = locationManager.location else { return nil }
        return userLocation
    }
    
    private func checkLocationAuthStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break;
        case .authorized:
            locationManager.requestAlwaysAuthorization()
        case .restricted, .denied, .authorizedWhenInUse, .notDetermined:
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            locationManager.requestAlwaysAuthorization()
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if #available(iOS 14.0, *) {
            print("available")
            print(manager.authorizationStatus.rawValue)
        } else {
            print("not available")
            print(CLLocationManager.authorizationStatus().rawValue)
        }
        
        checkLocationAuthStatus()
    }
    
    
    
}
