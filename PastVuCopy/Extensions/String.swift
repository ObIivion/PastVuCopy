//
//  String.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 26.04.2023.
//

import Foundation

extension String {
    
    public func splitedBy(length: Int) -> [String] {
        var result = [String]()
        for index in stride(from: 0, to: self.count, by: length) {
            let endIndex = self.index(self.endIndex, offsetBy: -index)
            let startIndex = self.index(endIndex, offsetBy: -length, limitedBy: self.startIndex) ?? self.startIndex
            result.append(String(self[startIndex..<endIndex]))
        }
        return result.reversed()
    }
    
}
