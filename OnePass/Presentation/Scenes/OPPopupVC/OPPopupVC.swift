//
//  OPPopupVC.swift
//  OnePass
//
//  Created by Duy Tran on 20/10/2022.
//

import UIKit

class OPPopupVC: OPBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .rgbColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        
    }

    @IBAction func backAction(_ sender: Any) {
        print("here")
        if((self.presentingViewController) != nil){
            self.dismiss(animated: true)
            
           }
//        self.navigationController?.dismiss(animated: true)
    }
    
}
