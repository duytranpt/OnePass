//
//  UserDefaults.swift
//  OnePass
//
//  Created by Duy Tran on 02/11/2022.
//

import Foundation

extension UserDefaults {
    static func clearPassModel(userSessionKey: String){
        UserDefaults.standard.removeObject(forKey: userSessionKey)
    }
    
    static func savePassModel(Model: [PassModel], userSessionKey: String) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(Model)
            UserDefaults.standard.setValue(data, forKey: userSessionKey)
        } catch {
            print("Unable to Encode Note (\(error))")
        }
        
    }
    
    static func getPassModel(userSessionKey: String) -> [PassModel]? {
        var dataModel: [PassModel] {
            let defaultObject = PassModel("My Object Name")
              if let objects = UserDefaults.standard.value(forKey: userSessionKey) as? Data {
                 let decoder = JSONDecoder()
                 if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [PassModel] {
                    return objectsDecoded
                 } else {
                    return [defaultObject]
                 }
              } else {
                 return [defaultObject]
              }
           }
        return dataModel
    }
}
