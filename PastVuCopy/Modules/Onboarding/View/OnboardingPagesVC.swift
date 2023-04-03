//
//  ViewController.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 30.03.2023.
//

import UIKit

class OnboardingPagesVC: UIPageViewController {
    
    var pages: [UIViewController] = []
    
    private let viewModel = OnboardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        dataSource = self
        delegate = self
        
        setupPages()
    }

    
    func setupPages() {
        
        var localPages: [OnePageViewController] = []
        
        for _ in 0..<viewModel.pageModels.count {
            let page = OnePageViewController()
            localPages.append(page)
        
        }
        
        let modeledPages: [OnePageViewController] = zip(localPages, viewModel.pageModels).map {
            $0.setModel(model: $1)
            return $0
        }
        
        self.pages = modeledPages
        
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true)
        }
        
    }
}

extension OnboardingPagesVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = index - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard pages.count > previousIndex else {
            return nil
        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) ->
    UIViewController? {
        
        guard let index = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = index + 1
        
        guard pages.count != nextIndex else {
            return nil
        }
        
        guard pages.count > nextIndex else {
            return nil
        }
        
        return pages[nextIndex]
    }
}

extension OnboardingPagesVC {
    
    func goToNextPage() {
        
    }
    
}

