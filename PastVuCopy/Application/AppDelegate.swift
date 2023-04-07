//
//  AppDelegate.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 30.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = OnboardingScreen.build().pagesView
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

}

