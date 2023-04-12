//
//  UserDefaultsService.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import Foundation

// написать "если пользователь уже видел онбординг - больше не показывать, а сразу на карту"
class UserDefaultsService {
    
    private let userDefaults = UserDefaults()
    
    var isOnboardingViewed: Bool {
        userDefaults.bool(forKey: "isOnboardingViewed")
    }
    
    func setOnboardingViewed(_ isViewed: Bool) {
        userDefaults.set(isViewed, forKey: "isOnboardingViewed")
    }
}
