//
//  OPBaseVC.swift
//  OnePass
//
//  Created by Duy Tran on 03/11/2022.
//

import UIKit
import BisKit

class OPBaseVC: UIViewController {
    
    var navigationBarView: OPHeaderView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setHeader(title: String, subTitle: String, Type: OPHeaderView.OPHEADERTYPE) {
        navigationBarView = OPHeaderView(initHeaderView: title, subTitle: subTitle, type: Type, nav: self.navigationController, andFrame: CGRect(origin: .zero, size: CGSize(width: self.view.widthv, height: self.view.navbarHeight())))
        view.addSubview(navigationBarView!)
    }
    
    func hideAllButton() {
        navigationBarView?.rightButton?.isHidden = true
        navigationBarView?.backButton?.isHidden = true
    }
}

extension  OPBaseVC {

    func showNewAlertOkay(withMessage message:String, action: @escaping () -> Void) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            action()
        })
        alert.addAction(cancel)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    func showAlertHeader(title: String) {
        let biscuit = BiscuitViewController(title: title, timeout: 1.5)
        self.present(biscuit, animated: true, completion: nil)
    }
}

extension OPBaseVC {
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-=+:?/><.[]{}~"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func randomNumber(length: Int) -> String {
        let letters = "1234567890"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func checkNil(data: [PassModel]) -> [PassModel] {
        var arrCheck = data
        
        for i in data {
            if i.id == nil || i.id == "" {
                arrCheck.remove(element: i)
            }
        }
        
        return arrCheck
    }
    
    func checkItemExited(_ item: PassModel) -> Bool {
        let arr: [PassModel] = UserDefaults.getPassModel(userSessionKey: "Pass")!
        for i in arr {
            if i == item {
                return true
            }
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
