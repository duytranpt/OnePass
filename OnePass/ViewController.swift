//
//  ViewController.swift
//  OnePass
//
//  Created by Duy Tran on 19/10/2022.
//

import UIKit
import BisKit

class ViewController: OPBaseVC {
    
    @IBOutlet weak var displayLbl: UILabel!
    @IBOutlet weak var nameApp: UITextField!
    @IBOutlet weak var showLbl: UILabel!
    
    var item: PassModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setHeader(title: "Add new", subTitle: "", Type: .ONE_LINE_SIMPLE)
        let changeBackground = UIMenuItem(title: "Tap Me", action: #selector(changeBackgroundColour))
        UIMenuController.shared.menuItems = [changeBackground]
        view.endEditing(true)
        
        displayLbl.font = .fontBold(size: 30)
        
    }

    @objc func changeBackgroundColour() {
        self.view.backgroundColor = .cyan //just makes the background colour cyan
    }
    
    @IBAction func genPass(_ sender: Any) {
        displayLbl.font = .fontRegularItalic(size: 20)
        view.endEditing(true)
        
        let date = Date()
        let passWord = randomString(length: 20)
        item = PassModel(id: randomNumber(length: 10), dateCreate: date, app: nameApp.text ?? "", passWord: passWord)
        showLbl.text = "Áp: \(nameApp.text!) \nMk: \(passWord) \nDate: \(date)"
        
    }
    @IBAction func saveBtn(_ sender: Any) {
        var dataApp: [PassModel] = UserDefaults.getPassModel(userSessionKey: "Pass")!
        dataApp = self.checkNil(data: dataApp)
        
        if item == nil {
            self.showNewAlertOkay(withMessage: "Nhập tên app và gen pass") {
            }
        } else {
            if dataApp.isEmpty {
                if (item?.app?.string_not_empty())! {
                    dataApp.append(item!)
                    self.showAlertHeader(title: "Thêm thành công")
                } else {
                    self.showNewAlertOkay(withMessage: "Nhập tên app trước khi gen password") {
                    }
                }
            } else {
                for i in dataApp {
                    if i == item {
                        self.showNewAlertOkay(withMessage: "Đã tồn tại app và pass") {
                        }
                        break
                    } else {
                        if (item?.app?.string_not_empty())! {
                            if !self.checkItemExited(item!) {
                                dataApp.append(item!)
                                self.showAlertHeader(title: "Thêm thành công")
                                break
                            } else {
                                self.showNewAlertOkay(withMessage: "Đã tồn tại app và pass") {
                                }
                                break
                            }
                        } else {
                            self.showNewAlertOkay(withMessage: "Nhập tên app trước khi gen password") {
                            }
                        }
                    }
                }
            }
        }
        print("dataApp: \(dataApp)")
        UserDefaults.savePassModel(Model: dataApp, userSessionKey: "Pass")
    }
}
 


