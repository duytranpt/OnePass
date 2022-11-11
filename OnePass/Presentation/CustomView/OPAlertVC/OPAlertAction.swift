//
//  OPAlertAction.swift
//  OnePass
//
//  Created by Duy Tran on 03/11/2022.
//

import UIKit

class OPAlertAction: UIAlertAction {
    
    class func defaultAction(withTitle title: String?, handler: @escaping (UIAlertAction?) -> Void) -> Self {
        return self.init(title: title, style: .default, handler: handler)
    }
    
    class func cancelAction(withTitle title: String?, handler: @escaping (UIAlertAction?) -> Void) -> Self {
        return self.init(title: title, style: .cancel, handler: handler)
    }
}
