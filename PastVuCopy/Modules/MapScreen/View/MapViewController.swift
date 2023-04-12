//
//  MapViewController.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 11.04.2023.
//

import UIKit

class MapViewController: BaseViewController<MapView> {
    
    var mapViewModel: MapViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.plusButton.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        mainView.minusButton.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        mainView.profileButton.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        mainView.favouritesButton.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        mainView.compassButton.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        
        
        
    }
    
    @objc func plusButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @objc func minusButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @objc func cameraButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @objc func favouritesButtonPressed(_ sender: UIButton) {
        
        
    }
    
    @objc func profileButtonPressed(_ sender: UIButton) {
        
        
    }

}
