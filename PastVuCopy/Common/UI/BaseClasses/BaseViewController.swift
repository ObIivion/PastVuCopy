//
//  BaseViewController.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import UIKit

class BaseViewController<T: UIView>: UIViewController {
    
    var mainView: T { view as! T }
    
    override func loadView() {
        super.loadView()
        view = T()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
