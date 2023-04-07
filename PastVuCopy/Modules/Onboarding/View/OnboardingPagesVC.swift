//
//  ViewController.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 30.03.2023.
//

import UIKit

protocol OnboardingInput: AnyObject {
    func setupPages(with model: [OnboardingPageModel])
}

class OnboardingPagesVC: UIPageViewController {
    
    private let pageVCView = PageControllerView(frame: UIScreen.main.bounds)
    private var pages: [UIViewController] = []
    var viewModel: OnboardingOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pageVCView)
        
        dataSource = self
        delegate = self
        
        pageVCView.arrowButton.addTarget(self, action: #selector(nextTapped(_:)), for: .touchUpInside)
        
        viewModel.getData()
        setupPageControl()
    }
    
    @objc private func nextTapped(_ sender: UIButton) {
        pageVCView.pageControl.currentPage += 1
        goToNextPage()
    }
    
    private func setupPageControl() {
        pageVCView.pageControl.currentPage = 1
        pageVCView.pageControl.numberOfPages = pages.count
    }
}

extension OnboardingPagesVC: OnboardingInput {
    
    func setupPages(with model: [OnboardingPageModel]) {
        var localPages: [OnePageViewController] = []
        for _ in 0..<model.count { localPages.append(OnePageViewController()) }
        
        let modeledPages: [OnePageViewController] = zip(localPages, model).map {
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
        
        guard let index = pages.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = index - 1
        
        guard previousIndex >= 0 else { return nil }
        guard pages.count > previousIndex else { return nil }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) ->
    UIViewController? {
        
        guard let index = pages.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = index + 1
        
        guard pages.count != nextIndex else { return nil }
        guard pages.count > nextIndex else { return nil }
        
        return pages[nextIndex]
    }
}

extension OnboardingPagesVC {
    
    private func goToNextPage() {
        guard let currentPage = viewControllers?.first else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        setViewControllers([nextPage], direction: .forward, animated: true)
    }
}
