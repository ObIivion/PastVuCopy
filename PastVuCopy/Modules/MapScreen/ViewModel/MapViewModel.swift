//
//  MapViewModel.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 11.04.2023.
//

import Foundation
import UIKit

class MapViewModel {
    
    weak var view: UIViewController?
    private let router: MapScreenRouter
    
    init(router: MapScreenRouter) {
        self.router = router
    }
    
}
