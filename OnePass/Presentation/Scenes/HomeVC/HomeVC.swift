//
//  HomeVC.swift
//  OnePass
//
//  Created by Duy Tran on 20/10/2022.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var contentLbl: OPLabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.roundCorners(radius: 20, corners: .allCorners)
        mainView.roundCorners(radius: 20, corners: [.bottomLeft, .bottomRight])
                  
        let args: [NSString] = ["(VNPAY)"]
        let date = Date()
      
        var newDate = self.formatDate(date: date)
        print("date: \(date)")
        print("newDate: \(newDate)")
        print(newDate.reformatDateString(fromFormat: "yyyy-MM-dd HH:mm:ssz", toFormat: "EEEE, dd/MM/yyyy HH:mm")!)
        
        let dateFrString = Date.dateFromString(from: newDate, withFormat: "yyyy-MM-dd HH:mm:ss")
        print("dateFrString: \(dateFrString)")
        
        let fullString = String(format: "Công ty Cổ phần Giải pháp thanh toán Việt Nam %@ Tầng 8, số 22 phố Láng Hạ, phường Láng Hạ, quận Đống Đa, thành phố Hà Nội", arguments: args)
        contentLbl.formatText(fullString: fullString as NSString, boldPartOfString: args, font: OPFonts.fontMedium(size: 13), boldFont: OPFonts.fontBoldItalic(size: 13), color: .red, underLine: true)
      
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "vi_VN")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        return formatter.string(from: date)
    }
    
    @IBAction func addAction(_ sender: Any) {
        let stb = UIStoryboard(name: "OPPopupVC", bundle: Bundle.main)
        let vc = stb.instantiateViewController(withIdentifier: "OPPopupVC") as! OPPopupVC
        vc.modalPresentationStyle = .formSheet
        vc.isModalInPresentation  = true

        if #available(iOS 15.0, *) {
            if let sheet = vc.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.preferredCornerRadius = 20
            }
        }
        
        self.navigationController?.present(vc, animated: true)
    }
}



