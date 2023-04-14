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
    let presenter: OnboardingPresenter
    
    private init(pagesView: OnboardingPagesVC, presenter: OnboardingPresenter) {
        self.pagesView = pagesView
        self.presenter = presenter
    }
    
    static func build() -> OnboardingScreen {
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter(router: router)
        let pagesViewController = OnboardingPagesVC(transitionStyle: .scroll, navigationOrientation: .horizontal)
        presenter.view = pagesViewController
        pagesViewController.presenter = presenter
        router.viewController = pagesViewController
        return OnboardingScreen(pagesView: pagesViewController, presenter: presenter)
    }
    
}
