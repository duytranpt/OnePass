//
//  UIView+.swift
//  OnePass
//
//  Created by Duy Tran on 19/10/2022.
//

import UIKit

extension UIView {
    func roundCorners(radius: CGFloat = 10, corners: UIRectCorner = .allCorners) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            var arr: CACornerMask = []
            
            let allCorners: [UIRectCorner] = [.topLeft, .topRight, .bottomLeft, .bottomRight, .allCorners]
            
            for corn in allCorners {
                if(corners.contains(corn)){
                    switch corn {
                    case .topLeft:
                        arr.insert(.layerMinXMinYCorner)
                    case .topRight:
                        arr.insert(.layerMaxXMinYCorner)
                    case .bottomLeft:
                        arr.insert(.layerMinXMaxYCorner)
                    case .bottomRight:
                        arr.insert(.layerMaxXMaxYCorner)
                    case .allCorners:
                        arr.insert(.layerMinXMinYCorner)
                        arr.insert(.layerMaxXMinYCorner)
                        arr.insert(.layerMinXMaxYCorner)
                        arr.insert(.layerMaxXMaxYCorner)
                    default: break
                    }
                }
            }
            self.layer.maskedCorners = arr
        } else {
            self.roundCornersBezierPath(corners: corners, radius: radius)
        }
    }

    private func roundCornersBezierPath(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    var x: CGFloat {
        get {
            self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var heightv: CGFloat {
        get {
            self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var widthv: CGFloat {
        get {
            self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var xRight: CGFloat {
        get {
            self.frame.origin.x + self.widthv
        }
        set {
            self.x = newValue - self.widthv
        }
    }
    
    var yBottom: CGFloat {
        get {
            self.y + self.heightv
        }
        set {
            self.y = yBottom - self.heightv
        }
    }
    
    @IBInspectable
    public var BGHexColor: String {
        set {
            self.backgroundColor = .colorFromHex(newValue)
        }
        
        get {
            return "hiha"
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return 1.0
        } set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.black
        } set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var vCornerRadius: CGFloat {
        get {
            return 1.0
        } set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor.clear
        } set {
            self.layer.masksToBounds = false
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        } set {
            self.layer.shadowRadius = newValue
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        } set {
            self.layer.shadowOffset = newValue
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        } set {
            self.layer.shadowOpacity = newValue
            self.layer.masksToBounds = false
        }
    }
    
   
    func fixInView(_ superView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: NavbarHeight().navbarHeight).isActive = true
    }
    
    func addAction(action: @escaping () -> Void) {
        let tapRecognizer = UITapGestureRecognizer { recognizer in
            action()
        }
        self.addGestureRecognizer(tapRecognizer)
    }
    
    var safeAreaTop: CGFloat {
        var topSafeAreaHeight: CGFloat = 0
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            let safeFrame = window.safeAreaLayoutGuide.layoutFrame
            topSafeAreaHeight = safeFrame.minY
        }
        return topSafeAreaHeight
    }

    func navbarHeight() -> CGFloat {
        var height: CGFloat = 64
        if checkiPhoneX() {
            height += 36
        }
        return height
    }
    
    func checkiPhoneX() -> Bool {
        return safeAreaTop > 20 ?  true : false
    }
    
    func HEADER_STATUSBAR() -> CGFloat {
        var height: CGFloat = 20
        if checkiPhoneX() {
            height = safeAreaTop
        }
        return height
    }
    
    func HEADER_HEIGH() -> CGFloat {
        var height: CGFloat = 64
        if checkiPhoneX() {
            height = safeAreaTop + 44
        }
        return height
    }

}

