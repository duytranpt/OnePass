//
//  OPAlertController.swift
//  OnePass
//
//  Created by Duy Tran on 01/11/2022.
//

import UIKit

class OPAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    static func alertController(withTitle title: String?, message: String?) -> Self {
        return self.init(title: title, message: message, preferredStyle: .alert)
    }
    
}
