//
//  MapViewController.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 11.04.2023.
//

import UIKit
import MapKit

protocol MapViewInput: AnyObject {
    func updateRegion(newRegion: MKCoordinateRegion)
}

class MapViewController: BaseViewController<MapView> {
    
    var presenter: MapOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.plusButton.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        mainView.minusButton.addTarget(self, action: #selector(minusButtonPressed(_:)), for: .touchUpInside)
        mainView.favouritesButton.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        mainView.compassButton.addTarget(self, action: #selector(compassButtonPressed(_:)), for: .touchUpInside)
        mainView.cameraButton.addTarget(self, action: #selector(cameraButtonPressed(_:)), for: .touchUpInside)
        
        mainView.mapView.delegate = self
        presenter.getUserRegion()
        
    }
    
    //        presenter.getClustersAndPhotos()
    
    @objc func plusButtonPressed(_ sender: UIButton) {
        //mainView.decreaseRegion()
        let rightDiv = Double(mainView.mapView.frame.size.width) / 256
        let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^mainView.mapView.currentZoom)) * rightDiv)
        
        print(#function)
        print("span", span)
        print("currentZoom", mainView.mapView.currentZoom)
        DispatchQueue.main.async {
            print("AsyncCurrentZoom", self.mainView.mapView.currentZoom)
            print("AsyncSpan", MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^self.mainView.mapView.currentZoom)) * rightDiv))
        }
        print("currentSpan", mainView.mapView.region.span)
        
        DispatchQueue.main.async {
            print("currentAsyncSpan", self.mainView.mapView.region.span)
        }
        
        let plusSpan = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^mainView.mapView.currentZoom + 1)) * rightDiv)
        let minusSpan = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^mainView.mapView.currentZoom - 1)) * rightDiv)
        
        print("plusSpan", plusSpan)
        print("minusSpan", minusSpan)
        
        //mainView.mapView.setRegion(region, animated: true)
    }
    
    @objc func minusButtonPressed(_ sender: UIButton) {
        //mainView.increaseRegion()
        var span = MKCoordinateSpan()
        let rightDiv = Double(mainView.mapView.frame.size.width) / 256
        
        DispatchQueue.main.async {
            span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^self.mainView.mapView.currentZoom)) * rightDiv)
        }
        
        print(#function)
        print("currentZoom", mainView.mapView.currentZoom)
        print("currentSpan", mainView.mapView.region.span)
        print(span)
        
        let plusSpan = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^mainView.mapView.currentZoom + 1)) * rightDiv)
        let minusSpan = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^mainView.mapView.currentZoom - 1)) * rightDiv)
        
        print("plusSpan", plusSpan)
        print("minusSpan", minusSpan)
    }
    
    @objc func cameraButtonPressed(_ sender: UIButton) {
        //  TODO
        
    }
    
    @objc func favouritesButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @objc func compassButtonPressed(_ sender: UIButton) {
        presenter.getUserRegion()
    }
    
}

extension MapViewController: MapViewInput {
    
    func updateRegion(newRegion: MKCoordinateRegion) {
        mainView.updateMapRegion(newRegion: newRegion)
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let rightDiv = Double(mainView.mapView.frame.size.width) / 256
        let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^mainView.mapView.currentZoom)) * rightDiv)
        print(#function)
        print("span", span)
        print("currentSpan", mainView.mapView.region.span)
        print("currentZoom", mainView.mapView.currentZoom)
        
        let plusSpan = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^mainView.mapView.currentZoom + 1)) * rightDiv)
        let minusSpan = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^mainView.mapView.currentZoom - 1)) * rightDiv)
        
        print("plusSpan", plusSpan)
        print("minusSpan", minusSpan)
    }
    
}
