//
//  String+.swift
//  OnePass
//
//  Created by Duy Tran on 20/10/2022.
//

import Foundation

extension String {
    
    func localized(table: String? = nil, bundle: Bundle = .main, _ args: CVarArg...) -> String {
        return String(format: NSLocalizedString(self, tableName: table, bundle: bundle, value: self, comment: ""), args.first!)
    }
    
    func bo_dau_Tieng_Viet() -> String? {
        var vn = replacingOccurrences(of: "đ", with: "d")
        vn = vn.replacingOccurrences(of: "Đ", with: "D")
        let data = vn.data(using: .ascii, allowLossyConversion: true)
        var en: String? = nil
        if (data != nil) {
            en = String(data: data!, encoding: .ascii)
        }
        return en
    }
    
    func string_not_empty() -> Bool {
        if !(self is NSString) {
            return false
        }
        if ((self as? String)?.trim()?.count ?? 0) > 0 {
            return true
        }
        return false
    }
    
    func trim() -> String? {
        return trimmingCharacters(in: .whitespaces)
    }
    
    func reformatDateString(fromFormat ff: String?, toFormat tf: String?) -> String? {

        let fmt = DateFormatter()
        fmt.calendar = Calendar(identifier: .gregorian)
        fmt.locale = Locale(identifier: "vi_VN")
        fmt.dateFormat = ff
        let dt = fmt.date(from: self)
        fmt.dateFormat = tf
        if (dt != nil) {
            return fmt.string(from: dt!)
        }
        return ""
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

@available(iOS 15, *)
extension Date {
    static func dateFromString(from string: String?, withFormat format: String?) -> Date? {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        formatter.dateFormat = format
        let date = formatter.date(from: string ?? "")
        return date
    }
    
    static func date(from string: String?, withFormat format: String?) -> Date? {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        formatter.dateFormat = format
        let date = formatter.date(from: string ?? "")
        return date
    }
    
    static func dateFromString(_ date: String?, withFormat format: String?)-> Date? {
        let isoDate = date
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from:isoDate ?? "")
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date ?? Date.now)
        
        let finalDate = calendar.date(from:components)
        
        return finalDate
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "vi_VN")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        return formatter.string(from: date)
    }

}
