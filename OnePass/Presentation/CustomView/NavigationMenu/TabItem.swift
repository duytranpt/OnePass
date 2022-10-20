//
//  TabItem.swift
//  OnePass
//
//  Created by Duy Tran on 20/10/2022.
//

import UIKit

enum TabItem: String, CaseIterable {
    case home = "home"
    case calender = "calender"
    case friends = "friends"
    case profile = "profile"

    var viewController: UIViewController {
        switch self {
        case .home:
            let storyBoard = UIStoryboard(name: "HomeVC", bundle:Bundle.main)
            let vc = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            return vc
        case .calender:
            let storyBoard = UIStoryboard(name: "Main", bundle:Bundle.main)
            let vc = storyBoard.instantiateViewController(withIdentifier: "MainVC") as! ViewController
            return vc
        case .friends:
            return HomeVC()
        case .profile:
            let storyBoard = UIStoryboard(name: "HomeVC", bundle:Bundle.main)
            let vc = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            return vc
            
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "house")!
        case .calender:
            return UIImage(named: "icon_calender")!
        case .friends:
            return UIImage(named: "icon_friends")!
        case .profile:
            return UIImage(named: "user")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}

class customTap: UITapGestureRecognizer {
  var cutomTag: TabItem?
}
