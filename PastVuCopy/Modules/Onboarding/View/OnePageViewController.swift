//
//  PageOneVC.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import UIKit

class OnePageViewController: BaseViewController<OnboardingPageView> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setModel(model: OnboardingPageModel) {
        mainView.setData(model: model)
    }

}
