//
//  OPHeaderView.swift
//  OnePass
//
//  Created by Duy Tran on 03/11/2022.
//

import UIKit

class OPHeaderView: UIView {

    enum OPHEADERTYPE : Int {
        case ONE_LINE_SIMPLE
        case ONE_LINE_DES
        case TWO_LINE
    }
    var backButton: OPButton?
    var rightButton: OPButton?
    var homeButton: OPButton?
    var titleLabel: UILabel?
    var subTitleLabel: UILabel?
    var imgBongSen: UIImageView?
    var gradientView: CAGradientLayer?
    weak var navC: UINavigationController?
    
    init?(initHeaderView title: String?, subTitle: String?, type: OPHEADERTYPE, nav: UINavigationController?, andFrame: CGRect) {
        super.init(frame: andFrame)
        
        let margin_Y: CGFloat = 13
        let s_Height_Header = self.HEADER_HEIGH()
        let s_Height_StatusBar = self.HEADER_STATUSBAR()
        
        self.backgroundColor = .orange
        self.navC = nav
        self.titleLabel = UILabel()
        self.titleLabel?.font = .fontBold(size: 15)
        self.titleLabel?.textColor = .white
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.text = title
        
        self.subTitleLabel = UILabel()
        self.subTitleLabel?.font = .fontMedium(size: 12)
        self.subTitleLabel?.textColor = .white
        self.subTitleLabel?.textAlignment = .center
        self.subTitleLabel?.numberOfLines = 0
        self.subTitleLabel?.text = subTitle
        
        self.imgBongSen = UIImageView(frame: CGRect(x: 0, y: self.height - self.height*89/100, width: self.height*131/100, height: self.height*89/100))
        self.imgBongSen?.image = UIImage(named: "maskGroup67")
        switch type {
        case .ONE_LINE_SIMPLE:
            self.titleLabel?.frame = CGRect(x: s_Height_Header - s_Height_StatusBar + margin_Y, y: s_Height_StatusBar, width: self.width - 2*(s_Height_Header - s_Height_StatusBar + margin_Y), height: s_Height_Header - s_Height_StatusBar)
            self.backButton = OPButton(HeaderButton: "icArrowbackWhite", isRight: false, rect: CGRect(x: 0, y: self.titleLabel!.y, width: self.titleLabel!.height, height: self.titleLabel!.height))
            
            self.rightButton = OPButton(HeaderButton: "icArrowbackWhite", isRight: true, rect: CGRect(x: self.width - 44, y: self.backButton!.y, width: 44, height: 44))
            
        case .ONE_LINE_DES:
            break
        case .TWO_LINE:
            self.backButton = OPButton(HeaderButton: "icArrowbackWhite", isRight: false, rect: CGRect(x: 0, y: s_Height_StatusBar, width: s_Height_Header - s_Height_StatusBar, height: s_Height_Header - s_Height_StatusBar))
            self.rightButton = OPButton(HeaderButton: "", isRight: true, rect: CGRect(x: self.width - self.backButton!.width, y: self.backButton!.y, width: self.backButton!.width, height: self.backButton!.height))
            
            self.titleLabel?.frame = CGRect(x: self.backButton!.xRight, y: self.backButton!.y, width: self.width - 2*self.backButton!.xRight, height: self.backButton!.height/2)
            self.subTitleLabel?.frame = CGRect(x: self.titleLabel!.x, y: self.titleLabel!.yBottom, width: self.titleLabel!.width, height: self.backButton!.height/2)
        }
        
        self.addSubview(titleLabel!)
        self.addSubview(subTitleLabel!)
        self.addSubview(backButton!)
        self.addSubview(rightButton!)
        self.addSubview(imgBongSen!)
        backButton?.addAction {
            self.navC?.popViewController(animated: true)
        }
        
        gradientView = CAGradientLayer()
        gradientView?.frame = self.frame
        gradientView?.startPoint = CGPoint.zero
        gradientView?.endPoint = CGPoint(x: 1, y: 1)
        gradientView?.colors = [
            UIColor.red.cgColor,
            UIColor.orange.cgColor
        ]
        self.layer.insertSublayer(gradientView!, at: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }

    
    func setTitle(_ title: String) {
        self.titleLabel?.text = title
    }
    
    func showRightButton(_ icon: String, action: @escaping () -> Void) {
        self.addSubview(rightButton!)
        rightButton?.imgView?.image = UIImage(named: icon)
        rightButton?.addAction {
            action()
        }
    }
    
    func removeGradient() {
        if (gradientView != nil) {
            self.gradientView?.removeFromSuperlayer()
            self.gradientView = nil
        }
    }
}
