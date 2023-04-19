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
        mainView.mapView.increaseZoom2()
    }
    
    @objc func minusButtonPressed(_ sender: UIButton) {
        mainView.mapView.decreaseZoom2()
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
        
        print("regionDidChange Span: ", mainView.mapView.region.span)
        
//        let rightDiv = Double(mainView.mapView.frame.size.width) / 256
//        let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^mainView.mapView.currentZoom)) * rightDiv / 100)
//        print()
//        print()
//        print()
//        print(#function)
//        print("span", span)
//        print("currentSpan", mainView.mapView.region.span)
//        print("currentZoom", mainView.mapView.currentZoom)
//
//        let plusSpan = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^mainView.mapView.currentZoom + 1)) * rightDiv / 100)
//        let minusSpan = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^mainView.mapView.currentZoom - 1)) * rightDiv / 100)
//
//        print("plusSpan", plusSpan)
//        print("minusSpan", minusSpan)
    }
    
}
