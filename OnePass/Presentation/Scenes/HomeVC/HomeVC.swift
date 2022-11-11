//
//  HomeVC.swift
//  OnePass
//
//  Created by Duy Tran on 20/10/2022.
//

import UIKit

class HomeVC: OPBaseVC {
    
    @IBOutlet weak var newinputView: UIView!
    @IBOutlet weak var contentLbl: OPLabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setHeader(title: "Xin chao", subTitle: "casc bajn", Type: .TWO_LINE)
        
        self.navigationBarView?.showRightButton("icCloseWhiteNew", action: {
            self.showNewAlertOkay(withMessage: "tat thong bao di") {
                print("hihihaha")
            }
        })
        print(contentView.checkiPhoneX())
        contentView.roundCorners(radius: 20, corners: .allCorners)
        mainView.roundCorners(radius: 20, corners: [.bottomLeft, .bottomRight])
                  
        let args: [NSString] = ["(VNPAY)"]
        let date = Date()
      
//        var newDate = self.formatDate(date: date)
//        print("date: \(date)")
//        print("newDate: \(newDate)")
//        print(newDate.reformatDateString(fromFormat: "yyyy-MM-dd HH:mm:ssz", toFormat: "EEEE, dd/MM/yyyy HH:mm")!)
        
        let otherDate = "Sep 12, 2018"
        if #available(iOS 15, *) {
            let dateFromString: Date = .dateFromString(otherDate, withFormat: "MMM d, yyyy")!
            print("otherDate: \(otherDate)")
            print("dateFromString: \(dateFromString)")
        }
        
        
        let fullString = String(format: "Công ty Cổ phần Giải pháp thanh toán Việt Nam %@ Tầng 8, số 22 phố Láng Hạ, phường Láng Hạ, quận Đống Đa, thành phố Hà Nội", arguments: args)
        contentLbl.formatText(fullString: fullString as NSString, boldPartOfString: args, font: .fontMedium(size: 13), boldFont: .fontBoldItalic(size: 13), color: .red, underLine: true)
        
        var demoview: OPTextInputView!
        demoview = OPTextInputView(newInputViewWithTitle: "Thông tin trên thẻ", andType: .INPUT_TYPE_NAME, andIsRequired: true, andFrame: CGRect(origin: .zero, size: CGSize(width: self.view.widthv - 30, height: 59)))
        newinputView.addSubview(demoview)
//        demoview.max_length = 15
    }
    
    @IBAction func addAction(_ sender: Any) {
//        let stb = UIStoryboard(name: "OPPopupVC", bundle: Bundle.main)
//        let vc = stb.instantiateViewController(withIdentifier: "OPPopupVC") as! OPPopupVC
//        vc.modalPresentationStyle = .formSheet
//        vc.isModalInPresentation  = true
//
//        if #available(iOS 15.0, *) {
//            if let sheet = vc.sheetPresentationController {
//                sheet.detents = [.medium(), .large()]
//                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
//                sheet.preferredCornerRadius = 20
//            }
//        }
//
//        self.navigationController?.present(vc, animated: true)
        
        let date = Date().timeIntervalSinceNow
        print(date)
    }
}



