//
//  OnboardingModel.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import Foundation
import UIKit

struct OnboardingPageModel {
    
    enum Page {
        case page1, page2, page3
    }
    
    let page: Page?
    
    var title: String? {
        switch page {
        case .page1:
            return Constants.onboardingPage1Title
        case .page2:
            return Constants.onboardingPage2Title
        case .page3:
            return Constants.onboardingPage3Title
        case .none:
            return nil
        }
    }
    
    var text: String? {
        switch page {
        case .page1:
            return Constants.onboardingPage1Text
        case .page2:
            return Constants.onboardingPage2Text
        case .page3:
            return Constants.onboardingPage3Text
        case .none:
            return nil
        }
    }
    
    var image: UIImage? {
        switch page {
        case .page1:
            return UIImage(named: "Page1Image")
        case .page2:
            return UIImage(named: "Page2Image")
        case .page3:
            return UIImage(named: "Page3Image")
        case .none:
            return nil
        }
    }
    
    var vectorImage: UIImage? {
        switch page {
        case .page1:
            return UIImage(named: "Page1Vector")
        case .page2:
            return UIImage(named: "Page2Vector")
        case .page3:
            return UIImage(named: "Page3Vector")
        case .none:
            return nil
        }
    }
    
}


