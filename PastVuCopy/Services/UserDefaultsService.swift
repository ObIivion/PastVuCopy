//
//  UserDefaultsService.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import Foundation

final class UserDefaultsService {
    
    static let shared = UserDefaultsService()
    
    private let userDefaults = UserDefaults.standard
    
    var isOnboardingViewed: Bool {
        get {
            userDefaults.bool(forKey: "isOnboardingViewed")
        }
        set {
            userDefaults.set(newValue, forKey: "isOnboardingViewed")
        }
        
    }
}
