//
//  Constants.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 31.03.2023.
//

import Foundation

enum Constants {
    
    static let baseUrl = URL(string: "https://pastvu.com/api2?method=")!
    
    private static func localizeString(_ key: String) -> String {
        return NSLocalizedString(key, tableName: "ru", bundle: Bundle.main, value: key, comment: key)
    }
    
    static let onboardingPage1Title = localizeString("explore")
    static let onboardingPage2Title = localizeString("study")
    static let onboardingPage3Title = localizeString("takePictures")
    static let onboardingPage1Text = localizeString("inMapOrListMode")
    static let onboardingPage2Text = localizeString("theHistoryOfYourCityOnPhotos")
    static let onboardingPage3Text = localizeString("compareHowUrbanEnvironmentChanged")
    
}
