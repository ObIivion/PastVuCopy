//
//  LocartionService.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 13.04.2023.
//

import Foundation
import MapKit
import CoreLocation

final class LocationService {
    
    private let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        return manager
    }()
    
    var userRegion: MKCoordinateRegion? {
        checkLocationServices()
        guard let userLocation = locationManager.location?.coordinate else { return nil }
        let userSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let userRegion = MKCoordinateRegion(center: userLocation, span: userSpan)
        print(userLocation)
        return userRegion
    }
    
    var userLocation: CLLocation? {
        guard let userLocation = locationManager.location else { return nil }
        return userLocation
    }
    
    private func checkLocationAuthStatus() {
        print(CLLocationManager.authorizationStatus())
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break;
        case .authorized:
            locationManager.requestAlwaysAuthorization()
        case .restricted, .denied, .authorizedWhenInUse, .notDetermined:
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            break;
        }
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthStatus()
        }
    }
}
