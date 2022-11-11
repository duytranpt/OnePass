//
//  OPAlertController.swift
//  OnePass
//
//  Created by Duy Tran on 01/11/2022.
//

import UIKit

class OPAlertController: UIAlertController {
    
    var alertIsBeingPresented: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        alertIsBeingPresented = false
        
    }
    
    func addCancelAction(withTitle title: String?, handler: @escaping () -> Void) {
        addAction(OPAlertAction.cancelAction(withTitle: title, handler: { _ in
            handler()
        }))
    }
    
    func showAlertOkayWithMessage(_ mess:String, action: @escaping () -> Void) -> UIAlertController {
        let noti = OPAlertController(title: "", message: mess, preferredStyle: .alert)
        noti.addCancelAction(withTitle: "Hello") {
            action()
        }
        return noti
    }
}

