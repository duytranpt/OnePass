//
//  Date+.swift
//  OnePass
//
//  Created by Duy Tran on 14/11/2022.
//

import Foundation

extension Date {
    static func dateFromStringg(from string: String?, withFormat format: String?) -> Date? {
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
        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date ?? Date())
        
        let finalDate = calendar.date(from:components)
        
        return finalDate
    }
    
    static func formatDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "vi_VN")
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    
    var millisecondsSince1970: Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
}
