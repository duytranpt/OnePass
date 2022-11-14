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
        
        self.setHeader(title: "OnePassword", subTitle: "keep all your passwords", Type: .TWO_LINE)
        self.hideAllButton()
        contentView.roundCorners(radius: 20, corners: .allCorners)
        mainView.roundCorners(radius: 20, corners: [.bottomLeft, .bottomRight])
                  
        let args: [NSString] = ["(VNPAY)"]
        let date = Date()
        let a = date.millisecondsSince1970
        print("millisecondsSince1970: \(a)")
        let today = Date.init(milliseconds: a)
        print("today: \(today)")
        let stringToday = Date.formatDate(date: today, format: "EEEE, dd/MM/yyyy HH:mm:ss")
        print("stringToday: \(String(describing: stringToday))")
        

//        var newDate = self.formatDate(date: date)
//        print("date: \(date)")
//        print("newDate: \(newDate)")
//        print(newDate.reformatDateString(fromFormat: "yyyy-MM-dd HH:mm:ssz", toFormat: "EEEE, dd/MM/yyyy HH:mm")!)
        
//        let otherDate = "Sep 12, 2018"
//        if #available(iOS 15, *) {
//            let dateFromString: Date = .dateFromString(otherDate, withFormat: "MMM d, yyyy")!
//            print("otherDate: \(otherDate)")
//            print("dateFromString: \(dateFromString)")
//        }
        
        
        let fullString = String(format: "Công ty Cổ phần Giải pháp thanh toán Việt Nam %@ Tầng 8, số 22 phố Láng Hạ, phường Láng Hạ, quận Đống Đa, thành phố Hà Nội", arguments: args)
//        contentLbl.formatText(fullString: fullString as NSString, boldPartOfString: args, font: .fontMedium(size: 13), boldFont: .fontBoldItalic(size: 13), color: .red, underLine: true)
        
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



