//
//  OPPopupVC.swift
//  OnePass
//
//  Created by Duy Tran on 20/10/2022.
//

import UIKit

class OPPopupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func backAction(_ sender: Any) {
        print("here")
        if((self.presentingViewController) != nil){
            self.dismiss(animated: true)
            
           }
//        self.navigationController?.dismiss(animated: true)
    }
    
}
