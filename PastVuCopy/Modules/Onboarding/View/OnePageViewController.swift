//
//  PageOneVC.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import UIKit

protocol OnboardingPage: AnyObject {
    func setModel(model: OnboardingPageModel)
}

class OnePageViewController: BaseViewController<OnboardingPageView> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OnePageViewController: OnboardingPage {
    
    func setModel(model: OnboardingPageModel) {
        mainView.setData(model: model)
    }
    
}
