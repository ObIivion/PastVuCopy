//
//  ViewController.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 30.03.2023.
//

import UIKit

class OnboardingPagesVC: UIPageViewController {
    
    private let viewModel = OnboardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        let pages: [OnePageViewController] = Array(repeating: OnePageViewController(), count: viewModel.pageModels.count)
        let modeledPages: [OnePageViewController] = zip(pages, viewModel.pageModels).map {
            $0.setModel(model: $1)
            return $0
        }
        
        setViewControllers(modeledPages, direction: .forward, animated: true)
    }
}

extension OnboardingPagesVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllers = viewControllers else { return nil }
        guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        
        return previousIndex < 0 ? nil : viewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) ->
    UIViewController? {
        
        guard let viewControllers = viewControllers else { return nil }
        guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        
        return nextIndex > viewControllers.count ? nil : viewControllers[nextIndex]
    }
}

extension OnboardingPagesVC {
    
    func goToNextPage() {
        
    }
    
}

