//
//  ViewController.swift
//  OnePass
//
//  Created by Duy Tran on 19/10/2022.
//

import UIKit
import BisKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLbl: UILabel!
    @IBOutlet weak var nameApp: UITextField!
    @IBOutlet weak var showLbl: UILabel!
    
    var dataApp: [PassModel] = UserDefaults.getPassModel(userSessionKey: "Pass")!
    var item: PassModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let changeBackground = UIMenuItem(title: "Tap Me", action: #selector(changeBackgroundColour))
        UIMenuController.shared.menuItems = [changeBackground]
        view.endEditing(true)
        
        displayLbl.font = OPFonts.fontBold(size: 30)

    }
    
    @objc func changeBackgroundColour() {
        self.view.backgroundColor = .cyan //just makes the background colour cyan
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-=+:?/><.[]{}~"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    @IBAction func genPass(_ sender: Any) {
        displayLbl.font = OPFonts.fontRegularItalic(size: 20)
        view.endEditing(true)
        
        let date = Date()
        let passWord = randomString(length: 20)
        item = PassModel(dateCreate: date, app: nameApp.text ?? "", passWord: passWord)
        showLbl.text = "Áp: \(nameApp.text!) \nMk: \(passWord) \nDate: \(date)"
        
    }
    @IBAction func saveBtn(_ sender: Any) {
        
        if item == nil {
            let biscuit = BiscuitViewController(title: "Nhập tên app và gen pass", timeout: 1.5)
            self.present(biscuit, animated: true, completion: nil)
        } else {
            if dataApp.isEmpty {
                dataApp.append(item!)
            } else {
                for i in dataApp {
                    if i == item {
                        let biscuit = BiscuitViewController(title: "Đã tồn tại app và pass", timeout: 1.5)
                        self.present(biscuit, animated: true, completion: nil)
                    } else {
                        dataApp.append(item!)
                        let biscuit = BiscuitViewController(title: "Thêm thành công", timeout: 1.5)
                        self.present(biscuit, animated: true, completion: nil)
                    }
                }
            }
        }
        UserDefaults.savePassModel(Model: dataApp, userSessionKey: "Pass")
    }
}


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
