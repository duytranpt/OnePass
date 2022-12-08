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
        navigationBarView = OPHeaderView(initHeaderView: title, subTitle: subTitle, type: Type, nav: self.navigationController, andFrame: CGRect(origin: .zero, size: CGSize(width: self.view.width, height: self.view.navbarHeight())))
        view.addSubview(navigationBarView!)
    }
    
    func hideAllButton() {
        navigationBarView?.rightButton?.isHidden = true
        navigationBarView?.backButton?.isHidden = true
    }
    
    func setBackAction(_ callback: @escaping () -> Void) {
        if (navigationBarView != nil) {
            navigationBarView!.backButton?.removeTarget(
                nil,
                action: nil,
                for: .allEvents)
            navigationBarView!.backButton?.addAction {
                callback()
            }
        }
    }
    
    func backtoViewController(parentVC: UIViewController) {
        if parentVC == nil {
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            self.navigationController?.popToViewController(parentVC, animated: true)
        }
    }
    
    func showRightButton(_ callback: @escaping () -> Void) {
        self.navigationBarView?.showRightButton(action: {
            callback()
        })
    }
    
    func showRightButtonWithImg(img: String, _ callback: @escaping () -> Void) {
        self.navigationBarView?.showRightButtonWithImg(img: img, {
            callback()
        })
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

extension OPBaseVC {
    func openWebView(_ url: String) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
    
}
   
