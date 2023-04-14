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
        userDefaults.bool(forKey: "isOnboardingViewed")
    }
    
    func setOnboardingViewed(_ isViewed: Bool) {
        userDefaults.set(isViewed, forKey: "isOnboardingViewed")
    }
}
