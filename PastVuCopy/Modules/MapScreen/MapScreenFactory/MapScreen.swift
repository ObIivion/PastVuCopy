//
//  MapScreen.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 12.04.2023.
//

import Foundation
import UIKit

class MapScreen {
    
    let viewController: MapViewController
    let viewModel: MapViewModel
    
    private init(viewController: MapViewController, viewModel: MapViewModel) {
        self.viewController = viewController
        self.viewModel = viewModel
    }
    
    static func build() -> MapScreen {
        
        let viewController = MapViewController()
        let router = MapScreenRouter()
        let viewModel = MapViewModel(router: router)
        viewModel.view = viewController
        router.viewController = viewController
        return MapScreen(viewController: viewController, viewModel: viewModel)
    }
    
}
