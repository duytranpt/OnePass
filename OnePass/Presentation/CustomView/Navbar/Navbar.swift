//
//  Navbar.swift
//  OnePass
//
//  Created by Duy Tran on 21/10/2022.
//

import UIKit

class Navbar: BaseView {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet var contentView: UIView!
    
    override func commonInit() {
        Bundle.main.loadNibNamed("Navbar", owner: self)
        contentView.fixInView(self)
        xibSetup()
    }
    
    func xibSetup() {
        backBtn.isHidden = true
        rightBtn.isHidden = true
        titleLbl.text = "One Password"
        titleLbl.textColor = .cgRGB(rgb: "47 47 47")
        titleLbl.font = OPFonts.fontBold(size: 15)
    }
    
     
}

class NavbarHeight {
    
    var navbarHeight: CGFloat = {
        var height: CGFloat = 64
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let topPadding = window?.safeAreaInsets.top
            let bottomPadding = window?.safeAreaInsets.bottom
            if topPadding ?? 0 > 20 {
                height += 36
            }

        }
       
        return height
    }()
}
