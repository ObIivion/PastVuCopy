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
    
    @objc func plusButtonPressed(_ sender: UIButton) {
        mainView.mapView.zoomIn()
    }
    
    @objc func minusButtonPressed(_ sender: UIButton) {
        mainView.mapView.zoomOut()
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
       
        let topLeftCoord = mapView.convert(CGPoint(x: 0, y: 0), toCoordinateFrom: mapView)
        let topRightCoord = mapView.convert(CGPoint(x: mapView.frame.width, y: 0), toCoordinateFrom: mapView)
        let bottomLeftCoord = mapView.convert(CGPoint(x: 0, y: mapView.frame.height), toCoordinateFrom: mapView)
        let bottomRightCoord = mapView.convert(CGPoint(x: mapView.frame.width, y: mapView.frame.height), toCoordinateFrom: mapView)
        
        var polygon = [CLLocationCoordinate2D]()
        polygon.append(topLeftCoord)
        polygon.append(bottomLeftCoord)
        polygon.append(bottomRightCoord)
        polygon.append(topRightCoord)
        polygon.append(topLeftCoord)
        
        Task {
            await presenter.getPhotosByBounds(geoPolygon: polygon, zoomLevel: mapView.currentZoom)
        }
    }
}
