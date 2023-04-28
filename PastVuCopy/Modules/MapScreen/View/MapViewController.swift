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
    func setAnnotations(annotations: [MKPointAnnotation])
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
        mainView.mapView.register(PhotoAnnotationView.self, forAnnotationViewWithReuseIdentifier: PhotoAnnotationView.identifier)
        mainView.mapView.register(ClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: ClusterAnnotationView.identifier)
        
        presenter.getUserRegion()
    }
    
    @objc private func plusButtonPressed(_ sender: UIButton) {
        mainView.mapView.zoomIn()
    }
    
    @objc private func minusButtonPressed(_ sender: UIButton) {
        mainView.mapView.zoomOut()
    }
    
    @objc private func cameraButtonPressed(_ sender: UIButton) {
        //  TODO
        
    }
    
    @objc private func favouritesButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @objc private func compassButtonPressed(_ sender: UIButton) {
        presenter.getUserRegion()
    }
    
}

extension MapViewController: MapViewInput {
    
    func updateRegion(newRegion: MKCoordinateRegion) {
        mainView.updateMapRegion(newRegion: newRegion)
    }
    
    func setAnnotations(annotations: [MKPointAnnotation]) {
        let allAnnotations = mainView.mapView.annotations
        mainView.mapView.removeAnnotations(allAnnotations)
        mainView.mapView.addAnnotations(annotations)
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let photoAnnotation = (annotation as? PhotoPointAnnotation) {
            let photoAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: PhotoAnnotationView.identifier, for: photoAnnotation) as! PhotoAnnotationView
            photoAnnotationView.setPhoto(url: photoAnnotation.photoUrl)
            return photoAnnotationView
        }
        
        if let clusterAnnotaion = (annotation as? ClusterPointAnnotation) {
            let clusterAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: ClusterAnnotationView.identifier, for: clusterAnnotaion) as! ClusterAnnotationView
            clusterAnnotationView.setCount(clusterAnnotaion.count)
            return clusterAnnotationView
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        if let photo = (view.annotation as? PhotoPointAnnotation) {
            let photoCoordinate = photo.coordinate
            let currentSpan = mapView.region.span
            let photoRegion = MKCoordinateRegion(center: photoCoordinate, span: currentSpan)
            mapView.setRegion(photoRegion, animated: true)
        }
    }
}
