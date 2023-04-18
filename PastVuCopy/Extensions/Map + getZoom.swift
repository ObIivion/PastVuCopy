//
//  Map + getZoom.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 18.04.2023.
//

import Foundation
import MapKit
import UIKit

extension MKMapView {
    
    var currentZoom: UInt {
        return UInt(log2(360 * ((Double(frame.size.width) / 256) / self.region.span.longitudeDelta)) + 1);
    }
    
    func setZoomLevel(zoomLevel: UInt) {
        self.setCenterCoordinate(centerCoordinate: centerCoordinate, zoomLevel: zoomLevel, animated: true)
    }
    
    func setCenterCoordinate(centerCoordinate: CLLocationCoordinate2D, zoomLevel: UInt, animated: Bool) {
        let rightDiv = Double(self.frame.size.width) / 256
        let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^zoomLevel)) * rightDiv)
        setRegion(MKCoordinateRegion(center: centerCoordinate, span: span), animated: animated)
    }
    
    public func increseZoom() {

        let zoom = Int(currentZoom + 1)

        // Double(frame.size.width) / region.span.longitudeDelta = 2^zoom * 128 / 360

        let doubleDivider = Double(2^zoom * 128 / 360)

        let newLongtitudeSpan = frame.size.width / doubleDivider

    //     let newSpan = MKCoordinateSpan(latitudeDelta: newLongtitudeSpan, longitudeDelta: newLongtitudeSpan)

        let rightDiv = Double(self.frame.size.width) / 256
        let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^zoom)) * rightDiv)
        let newRegion = MKCoordinateRegion(center: self.region.center, span: span)

        print("currentZoom: ", currentZoom)
        print("zoom: ", zoom)
        print("currentSpan", region.span)
        print("newSpan: ", newLongtitudeSpan)

        setRegion(newRegion, animated: true)

    }

    public func decreaseZoom() {
        
        let zoom = Int(currentZoom - 1)
        
        // Double(frame.size.width) / region.span.longitudeDelta = 2^zoom * 128 / 360
        
        let doubleDivider = Double(2^zoom * 128 / 360)
        
        let newLongtitudeSpan = frame.size.width / doubleDivider
        
        // let newSpan = MKCoordinateSpan(latitudeDelta: newLongtitudeSpan, longitudeDelta: newLongtitudeSpan)
        
        let rightDiv = Double(self.frame.size.width) / 256
        let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: Double(360 / (2^zoom)) * rightDiv)
        let newRegion = MKCoordinateRegion(center: self.region.center, span: span)
        
        print("currentZoom: ", currentZoom)
        print("zoom: ", zoom)
        print("currentSpan", region.span)
        print("newSpan: ", newLongtitudeSpan)
        
        setRegion(newRegion, animated: true)
        
    }
    
}
