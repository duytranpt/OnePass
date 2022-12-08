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
    @IBOutlet weak var btn2: UIView!
    @IBOutlet weak var btn3: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var navi: OPHeaderView!
    @IBOutlet weak var demoLbl: OPLabel!
    @IBOutlet weak var naviHeight: NSLayoutConstraint!
    
    @IBOutlet weak var topView: NSLayoutConstraint!
    let fileName = "landmarkData.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setHeader(title: "OnePassword", subTitle: "keep all your passwords", Type: .ONE_LINE_SIMPLE)
//        self.hideAllButton()
        let customView = StateView(initStateNumber: 5, numberOfState: 4, navC: self.navigationController)!
        
//        self.navigationBarView?.addCustomView(customView)
        contentView.roundCorners(radius: 20, corners: .allCorners)
        mainView.roundCorners(radius: 20, corners: [.bottomLeft, .bottomRight])
      
        
        let date = Date()
        let stringToday = Date.formatDate(date: date, format: "dd/MM/yyyy")
        print("String: \(String(describing: stringToday))")
        print("\(Date.dateFromStringg(from: stringToday, withFormat: "yyyy-MM-dd"))")
        let dateFromString: Date = .dateFromString(stringToday, withFormat: "yyyy-MM-dd") ?? Date()
        print("dateFromString: \(dateFromString)")
        
        //        demoview = OPTextInputView(newInputViewWithTitle: "Họ tên trên thẻ", andType: .INPUT_TYPE_NAME, andIsRequired: true, andFrame: CGRect(origin: .zero, size: CGSize(width: self.view.width - 30, height: 59)))
        var demoview: OPTextInputView!
        demoview = OPTextInputView(newInputViewWithTitle: "Họ và tên trên thẻ", andType: .INPUT_TYPE_NAME, andIsRequired: true,confirmBtnLbl: "In tên", andFrame: CGRect(origin: .zero, size: CGSize(width: self.view.width - 30, height: 59)), callback: {
            print(demoview.vTextField?.text)
        })
        demoview.setPlaceholder("Vd: Nguyen Van A")
        newinputView.addSubview(demoview)
        
        inputTextEmail.setUpView(title: "New email", andType: .INPUT_TYPE_EMAIL, andIsRequired: true)
        inputTextEmail.setPlaceholder("Input new email")
        
        btn1.addAction {
            self.inputTextEmail.addDashedBorder(lineWidth: 2, color: .text_Red_2)
            print(self.btn1.BGHexColor)
            self.navigationBarView?.removeGradient()
            self.topView.constant = 50
        }
        
        btn2.addAction {
            self.view.removeAllSubviews(type: OPTextInputView.self)
            self.topView.constant = 20
        }

//        self.showRightButton {
//            self.showNewAlertOkay(withMessage: "Xin chào các pẹn") {
//                print("Okokoko")
//            }
//        }
        
        self.showRightButtonWithImg(img: "icLogout") {
            self.showNewAlertOkay(withMessage: "Xin chào các pẹn") {
                print("Okokoko")
            }
        }
        
        let checkboxBtn:OPButton = .init(initCheckBoxBtn: CGRect(origin: .zero, size: CGSize(width: 20, height: 20)))
        checkboxBtn.center = btn1.center
        self.btn1.addSubview(checkboxBtn)
        
        let checkboxRound:OPButton = .init(initCheckBoxRound: CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 24, height: 24)))
       
        self.btn1.addSubview(checkboxRound)
        let phoneNumber: NSString = "0964151505"

        let fullString: NSString = "Vui lòng nhập mã xác thực được gửi về số điện thoại %@ của Quý khách để đăng nhập My Profile".localized(phoneNumber)
        
        let arrHightlight: [NSString] = ["số điện thoại", "My Profile", phoneNumber]
        demoLbl.formatText(fullString: fullString, boldPartOfString: arrHightlight, font: .fontMedium(size: 13), boldFont: .fontBold(size: 13), color: .red, underLine: false)
        demoLbl.numberOfLines = 0
        demoLbl.tapAction(key: arrHightlight) { number in
            print(fullString.sizeOfString(usingFont: .fontMedium(size: 13), widthLimit: self.view.width - 40))
            switch number {
            case 0:
                print(fullString.sizeOfString(usingFont: .fontMedium(size: 13), widthLimit: self.view.width - 40))
//                self.openWebView("https://instagram.com/duytran.pt")
            case 1:
                print(arrHightlight[number])
//                self.openWebView("https://facebook.com/duytran.pt")
            default:
                break
//                (361.8515625, 14.3203125)
            }
        }
        
        self.setBackAction {
            print("haha")
        }
        
        let pickerTimeView = TimePickerToolBarView(frame: CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.height-260), size: CGSize(width: self.view.width, height: 260)))
        
        self.view.addSubview(pickerTimeView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        naviHeight.constant = self.navigationBarView?.height ?? 0
    }

//extension HomeVC {
//    func save(_ password: String, for account: String) {
//        let password = password.data(using: String.Encoding.utf8)!
//        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
//                                    kSecAttrAccount as String: account,
//                                    kSecValueData as String: password]
//        let status = SecItemAdd(query as CFDictionary, nil)
//        guard status == errSecSuccess else { return print("save error") }
//
//    }
//
//    func retrivePassword(for account: String) -> String? {
//        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
//                                    kSecAttrAccount as String: account,
//                                    kSecMatchLimit as String: kSecMatchLimitOne,
//                                    kSecReturnData as String: kCFBooleanTrue]
//
//
//        var retrivedData: AnyObject? = nil
//        let _ = SecItemCopyMatching(query as CFDictionary, &retrivedData)
//
//
//        guard let data = retrivedData as? Data else {return nil}
//        return String(data: data, encoding: String.Encoding.utf8)
//    }
//
//    func saveToJsonFile() {
//        // Get the url of Persons.json in document directory
//        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//        let fileUrl = documentDirectoryUrl.appendingPathComponent("Persons.json")
//
//        let personArray =  [["person": ["name": "Dani", "age": "24"]], ["person": ["name": "ray", "age": "70"]]]
//
//        // Create a write-only stream
//        guard let stream = OutputStream(toFileAtPath: fileUrl.path, append: false) else { return }
//        stream.open()
//        defer {
//            stream.close()
//        }
//
//        // Transform array into data and save it into file
//        var error: NSError?
//        JSONSerialization.writeJSONObject(personArray, to: stream, options: [], error: &error)
//
//        // Handle error
//        if let error = error {
//            print(error)
//        }
//    }
//
//}



//extension JSONSerialization {
//
//    static func loadJSON(withFilename filename: String) throws -> Any? {
//        let fm = FileManager.default
//        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
//        if let url = urls.first {
//            var fileURL = url.appendingPathComponent(filename)
//            fileURL = fileURL.appendingPathExtension("json")
//            let data = try Data(contentsOf: fileURL)
//            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .mutableLeaves])
//            return jsonObject
//        }
//        return nil
//    }
//
//    static func save(jsonObject: Any, toFilename filename: String) throws -> Bool{
//        let fm = FileManager.default
//        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
//        if let url = urls.first {
//            var fileURL = url.appendingPathComponent(filename)
//            fileURL = fileURL.appendingPathExtension("json")
//            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
//            try data.write(to: fileURL, options: [.atomicWrite])
//            return true
//        }
//
//        return false
//    }
//}
}
