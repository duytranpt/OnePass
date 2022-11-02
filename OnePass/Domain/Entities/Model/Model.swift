//
//  Model.swift
//  OnePass
//
//  Created by Duy Tran on 01/11/2022.
//

import Foundation

struct PassModel: Codable {
    
    var dateCreate: Date?
    var app: String?
    var passWord: String?
    
    init(_ json: JSON) {
        dateCreate = json["dateCreate"].dateValue
        app = json["app"].stringValue
        passWord = json["passWord"].stringValue
    }
    
    init(dateCreate: Date, app: String, passWord: String) {
        self.dateCreate = dateCreate
        self.app = app
        self.passWord = passWord
    }
}

extension PassModel: Equatable {
    static func == (lhs: PassModel, rhs: PassModel) -> Bool {
        return
            lhs.dateCreate == rhs.dateCreate &&
            lhs.app == rhs.app &&
            lhs.passWord == rhs.passWord
    }
}

extension JSON {
    public var dateValue: Date? {
        get {
            if let str = self.string {
                return JSON.jsonDateFormatter.date(from: str)
            }
            return nil
        }
    }

    private static let jsonDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        return dateFormatter
    }()
}
