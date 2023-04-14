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
        
        presenter.getInitialRegion()
        
        
    }
    
    @objc func plusButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @objc func minusButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @objc func cameraButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @objc func favouritesButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @objc func compassButtonPressed(_ sender: UIButton) {
        
        
        
    }

}

extension MapViewController: MapViewInput {
    
    func updateRegion(newRegion: MKCoordinateRegion) {
        mainView.updateMapRegion(newRegion: newRegion)
    }
    
}
