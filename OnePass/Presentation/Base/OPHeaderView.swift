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
    weak var navC: UINavigationController?
    
    init?(initHeaderView title: String?, subTitle: String?, type: OPHEADERTYPE, nav: UINavigationController?, andFrame: CGRect) {
        super.init(frame: andFrame)
        
        let margin_X: CGFloat = 15
        let margin_Y: CGFloat = 13
        let k_HeightInputItem: CGFloat = 70
        let k_HeightButton: CGFloat = 44
        let s_Height_Header = self.HEADER_HEIGH()
        let s_Height_StatusBar = self.HEADER_STATUSBAR()
        
        self.backgroundColor = .orange
        self.navC = nav
        self.titleLabel = UILabel()
        self.titleLabel?.font = .fontBold(size: 15)
        self.titleLabel?.textColor = .black
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.text = title
        
        self.subTitleLabel = UILabel()
        self.subTitleLabel?.font = .fontMedium(size: 12)
        self.subTitleLabel?.textColor = .white
        self.subTitleLabel?.textAlignment = .center
        self.subTitleLabel?.numberOfLines = 0
        self.subTitleLabel?.text = subTitle
        
        switch type {
        case .ONE_LINE_SIMPLE:
            self.titleLabel?.frame = CGRect(x: s_Height_Header - s_Height_StatusBar + margin_Y, y: s_Height_StatusBar, width: self.widthv - 2*(s_Height_Header - s_Height_StatusBar + margin_Y), height: s_Height_Header - s_Height_StatusBar)
            self.backButton = OPButton(HeaderButton: "icArrowbackWhite", isRight: false, rect: CGRect(x: 0, y: self.titleLabel!.y, width: self.titleLabel!.heightv, height: self.titleLabel!.heightv))
            
            self.rightButton = OPButton(HeaderButton: "icArrowbackWhite", isRight: true, rect: CGRect(x: self.widthv - 44, y: self.backButton!.y, width: 44, height: 44))
            
        case .ONE_LINE_DES:
            break
        case .TWO_LINE:
            self.backButton = OPButton(HeaderButton: "icArrowbackWhite", isRight: false, rect: CGRect(x: 0, y: s_Height_StatusBar, width: s_Height_Header - s_Height_StatusBar, height: s_Height_Header - s_Height_StatusBar))
            self.rightButton = OPButton(HeaderButton: "", isRight: true, rect: CGRect(x: self.widthv - self.backButton!.widthv, y: self.backButton!.y, width: self.backButton!.widthv, height: self.backButton!.heightv))
            
            self.titleLabel?.frame = CGRect(x: self.backButton!.xRight, y: self.backButton!.y, width: self.widthv - 2*self.backButton!.xRight, height: self.backButton!.heightv/2)
            self.subTitleLabel?.frame = CGRect(x: self.titleLabel!.x, y: self.titleLabel!.yBottom, width: self.titleLabel!.widthv, height: self.backButton!.heightv/2)
        }
        
        self.addSubview(titleLabel!)
        self.addSubview(subTitleLabel!)
        self.addSubview(backButton!)
        self.addSubview(rightButton!)
        backButton?.addAction {
            print("POP")
            self.navC?.popViewController(animated: true)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}
