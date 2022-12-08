//
//  Model.swift
//  OnePass
//
//  Created by Duy Tran on 01/11/2022.
//

import Foundation

struct PassModel: Codable {
    
    var id: String?
    var dateCreate: Int64?
    var app: String?
    var passWord: String?
    
    init(_ json: JSON) {
        id = json["id"].stringValue
        dateCreate = json["dateCreate"].int64Value
        app = json["app"].stringValue
        passWord = json["passWord"].stringValue
    }
    
    init(id: String, dateCreate: Int64, app: String, passWord: String) {
        self.id = id
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
        lhs.id == rhs.id &&
        lhs.passWord == rhs.passWord
    }
}


struct newModel {
    var id: String?
    var dateCreate: Int64?
    var app: String?
    var passWord: String?
        
    init(id: String, dateCreate: Int64, app: String, passWord: String) {
        self.id = id
        self.dateCreate = dateCreate
        self.app = app
        self.passWord = passWord
    }
    
//    func saveData(objc: [newModel]) {
//        do {
//            try JSONSerialization.save(jsonObject: objc, toFilename: "newdata")
//        } catch {
//            print("error")
//        }
//    }
//    
//    func loadData() throws -> Any?{
//        do {
//            return try JSONSerialization.loadJSON(withFilename: "newdata")
//
//        } catch {
//            print("error")
//        }
//        return nil
//    }
}
