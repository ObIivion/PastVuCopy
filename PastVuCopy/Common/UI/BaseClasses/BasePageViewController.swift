//
//  BasePageViewController.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import UIKit

class BasePageViewController: UIPageViewController {
    
    init(viewControllers: UIViewController...) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        setViewControllers(viewControllers, direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
