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
    
    private init(pagesView: OnboardingPagesVC, viewModel: OnboardingViewModel) {
        self.pagesView = pagesView
        self.viewModel = viewModel
    }
    
    static func build() -> OnboardingScreen {
        let router = OnboardingRouter()
        let viewModel = OnboardingViewModel(router: router)
        let pagesViewController = OnboardingPagesVC(transitionStyle: .scroll, navigationOrientation: .horizontal)
        viewModel.view = pagesViewController
        pagesViewController.viewModel = viewModel
        router.viewController = pagesViewController
        return OnboardingScreen(pagesView: pagesViewController, viewModel: viewModel)
    }
    
}
