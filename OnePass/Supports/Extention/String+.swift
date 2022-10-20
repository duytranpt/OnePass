//
//  String+.swift
//  OnePass
//
//  Created by Duy Tran on 20/10/2022.
//

import Foundation

extension String {
    
    func localized(table: String? = nil, bundle: Bundle = .main, args: CVarArg...) -> String {
        return String(format: NSLocalizedString(self, tableName: table, bundle: bundle, value: self, comment: ""), args.first!)
    }

}

public extension NSObject {
    
    class func className() -> String {
        let className = (NSStringFromClass(self) as String).components(separatedBy: ".").last! as String
        return className
    }
    
    func className() -> String {
        let className = (NSStringFromClass(self.classForCoder) as String).components(separatedBy: ".").last! as String
        return className
    }
    
}
