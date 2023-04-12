//
//  OnboardingViewModel.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import Foundation
import Combine

protocol OnboardingOutput {
    func getData()
    func onboardingEnded()
}

class OnboardingViewModel {
    
    private let router: OnboardingRoutes
    private let pageModels = OnboardingPageModel.Page.allCases.map { OnboardingPageModel(page: $0) }
    weak var view: OnboardingInput?
    
    init(router: OnboardingRoutes) {
        self.router = router
    }
}

extension OnboardingViewModel: OnboardingOutput {
    
    func getData() {
        view?.setupPages(with: pageModels)
    }
    
    func onboardingEnded() {
        UserDefaultsService.shared.setOnboardingViewed(true)
        router.openMapScreen()
    }
}
