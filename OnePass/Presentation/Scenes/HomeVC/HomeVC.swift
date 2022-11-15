//
//  HomeVC.swift
//  OnePass
//
//  Created by Duy Tran on 20/10/2022.
//

import UIKit

class HomeVC: OPBaseVC {
    
    @IBOutlet weak var inputTextEmail: OPTextInputView!
    @IBOutlet weak var newinputView: UIView!
    @IBOutlet weak var btn1: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var navi: OPHeaderView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setHeader(title: "OnePassword", subTitle: "keep all your passwords", Type: .TWO_LINE)
//        self.hideAllButton()
        contentView.roundCorners(radius: 20, corners: .allCorners)
        mainView.roundCorners(radius: 20, corners: [.bottomLeft, .bottomRight])
        self.navigationBarView?.showRightButton("icCloseWhiteNew", action: {
            print("0oo0")
        })
        
        let date = Date()
        let a = date.millisecondsSince1970
        print("millisecondsSince1970: \(a)")
        let today = Date.init(milliseconds: a)
        print("today: \(today)")
        let stringToday = Date.formatDate(date: today, format: "EEEE, dd/MM/yyyy HH:mm:ss")
        print("stringToday: \(String(describing: stringToday))")
        

        
        var demoview: OPTextInputView!
        
        demoview = OPTextInputView(newInputViewWithTitle: "Số thẻ bông sen vàng", andType: .INPUT_TYPE_EMAIL, andIsRequired: true,confirmBtnLbl: "Xác thực", andFrame: CGRect(origin: .zero, size: CGSize(width: self.view.width - 30, height: 59)), callback: {
            print("Xacs thwwjc")
        })
        
        demoview.setPlaceholder("Nhập số thẻ bông sen vàng")
        newinputView.addSubview(demoview)

        
        inputTextEmail.setUpView(title: "New email", andType: .INPUT_TYPE_EMAIL, andIsRequired: true)
        inputTextEmail.setPlaceholder("Input new email")
        
        btn1.addAction {
            self.inputTextEmail.addDashedBorder(lineWidth: 2, color: .text_Red_2)
            print(self.btn1.BGHexColor)
            self.navigationBarView?.removeGradient()
        }
        
        let checkboxBtn:OPButton = .init(initCheckBoxBtn: CGRect(origin: .zero, size: CGSize(width: 20, height: 20)))
        checkboxBtn.center = btn1.center
        self.btn1.addSubview(checkboxBtn)
        
        let checkboxRound:OPButton = .init(initCheckBoxRound: CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 24, height: 24)))
       
        self.btn1.addSubview(checkboxRound)
        
    }
    
    @IBAction func addAction(_ sender: Any) {
        
        let date = Date().timeIntervalSinceNow
        print(date)
    }
}



