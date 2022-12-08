//
//  Array+.swift
//  OnePass
//
//  Created by Duy Tran on 24/11/2022.
//

import UIKit

extension Array {
    func array_not_empty() -> Bool {
        if !(self is [AnyHashable]) {
            return false
        }
        if ((self as? [AnyHashable])?.count ?? 0) > 0 {
            return true
        }
        return false
    }
}

extension Array where Element: Equatable{
    mutating func remove(element: Element) {
        if let i = self.firstIndex(of: element) {
            self.remove(at: i)
        }
    }
}
