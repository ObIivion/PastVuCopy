//
//  OnboardingRouter.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 07.04.2023.
//

import Foundation
import UIKit

protocol OnboardingRoutes {
    func openMapScreen()
}

class OnboardingRouter: OnboardingRoutes {
    
    var viewController: UIViewController!
    
    func openMapScreen() {
        let mapViewController = MapScreen.build().viewController
        mapViewController.modalPresentationStyle = .fullScreen
        viewController.present(mapViewController, animated: true)
        
    }
    
}
