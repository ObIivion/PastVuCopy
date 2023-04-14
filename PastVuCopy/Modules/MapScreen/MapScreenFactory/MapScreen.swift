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
    let presenter: MapPresenter
    
    private init(viewController: MapViewController, presenter: MapPresenter) {
        self.viewController = viewController
        self.presenter = presenter
    }
    
    static func build() -> MapScreen {
        
        let viewController = MapViewController()
        let router = MapScreenRouter()
        let presenter = MapPresenter(router: router)
        presenter.view = viewController
        viewController.presenter = presenter
        router.viewController = viewController
        return MapScreen(viewController: viewController, presenter: presenter)
    }
    
}
