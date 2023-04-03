//
//  PageOneVC.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import UIKit

protocol PageViewProtocol {
    func setModel(model: OnboardingPageModel)
}

class OnePageViewController: BaseViewController<OnboardingPageView> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OnePageViewController: PageViewProtocol {
    
    func setModel(model: OnboardingPageModel) {
        mainView.setData(model: model)
    }
    
}
