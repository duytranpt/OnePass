//
//  JSONDTO.swift
//  AgribankSample
//
//  Created by Sơn Trần on 14/01/2022.
//

import Foundation

extension JSON {
    subscript(dynamicMember member: String) -> Int {
        self[member].intValue
    }
    
    subscript(dynamicMember member: String) -> String {
        self[member].stringValue
    }
    
    subscript(dynamicMember member: String) -> Double {
        self[member].doubleValue
    }
    
    subscript(dynamicMember member: String) -> Array<JSON> {
        self[member].arrayValue
    }
    
    subscript(dynamicMember member: String) -> Dictionary<String, JSON> {
        self[member].dictionaryValue
    }
    
    subscript(dynamicMember member: String) -> NSNumber {
        self[member].numberValue
    }
    
    subscript(dynamicMember member: String) -> Bool {
        self[member].boolValue
    }
    
    subscript(dynamicMember member: String) -> JSON {
        self[member]
    }
    
    mutating func appendIfArray(json:JSON){
        if var arr = self.array{
//            arr.append(json)
            arr.insert(json, at: 0)
            self = JSON(arr);
        }
    }
    
    mutating func appendIfDictionary(key:String,json:JSON){
        if var dict = self.dictionary{
            dict[key] = json;
            self = JSON(dict);
        }
    }
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
