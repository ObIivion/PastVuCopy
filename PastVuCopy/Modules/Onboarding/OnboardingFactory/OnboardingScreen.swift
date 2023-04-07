//
//  OnboardingFactory.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 07.04.2023.
//

import Foundation
import UIKit

class OnboardingScreen {
    
    let pagesView: OnboardingPagesVC
    let viewModel: OnboardingViewModel
    let router: OnboardingRouter
    
    private init(pagesView: OnboardingPagesVC, viewModel: OnboardingViewModel, router: OnboardingRouter) {
        self.pagesView = pagesView
        self.viewModel = viewModel
        self.router = router
    }
    
    static func build() -> OnboardingScreen {
        let router = OnboardingRouter()
        let viewModel = OnboardingViewModel(router: router)
        let pagesViewController = OnboardingPagesVC(transitionStyle: .scroll, navigationOrientation: .horizontal)
        viewModel.view = pagesViewController
        pagesViewController.viewModel = viewModel
        
        return OnboardingScreen(pagesView: pagesViewController, viewModel: viewModel, router: router)
    }
    
}
