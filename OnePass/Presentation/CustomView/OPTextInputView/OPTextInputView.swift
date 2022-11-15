//
//  OPTextInputView.swift
//  OnePass
//
//  Created by Duy Tran on 02/11/2022.
//

import UIKit

class OPTextInputView: UIView {
    
    enum InputType: Int {
        case INPUT_TYPE_NOTE
        case INPUT_TYPE_NAME
        case INPUT_TYPE_EMAIL
        case INPUT_TYPE_PHONE
        case INPUT_TYPE_NUMBER
    }
    
    var titleLabel: UILabel?
    var vTextField: UITextField?
    var showHidePasswordButton: UIButton?
    var separatorView: UIView?
    var selfPadding: CGFloat = 0.0
    var typeInput: InputType?
    var max_length = 0
    var validCharacters: String?
    
    var mustUppercase = false
    
    init?(newInputViewWithTitle title: String?, andType: InputType, andIsRequired: Bool, andFrame: CGRect) {
        
        super.init(frame: andFrame)
        let width = andFrame.size.width
        let height = frame.size.height
        self.backgroundColor = .white
        typeInput = andType
        selfPadding = 14
        self.titleLabel = UILabel(frame: CGRect(x: 14, y: 10, width: width - 28, height: height/2 - 11))
        self.titleLabel?.font = .fontMedium(size: 13)
        let titleStr = andIsRequired ? "\(title!)*" : title
        let string = NSMutableAttributedString(string: titleStr!)
        
        if andIsRequired {
            string.addAttribute(.foregroundColor, value: UIColor.colorFromHex("919191"), range: NSRange(location: 0, length: titleStr!.count - 1))
            string.addAttribute(.foregroundColor, value: UIColor.colorFromHex("FF5C22"), range: NSRange(location: titleStr!.count - 1, length: 1))
        } else {
            string.addAttribute(.foregroundColor, value: UIColor.colorFromHex("919191"), range: NSRange(location: 0, length: titleStr!.count))
        }
        
        self.titleLabel?.attributedText = string
        self.titleLabel?.numberOfLines = 0
        self.addSubview(self.titleLabel!)
        
        self.vTextField = UITextField(frame: CGRect(x: 14, y: height/2 - 1, width: width - 28, height: height/2 - 5))
        self.vTextField?.textColor = .black
        self.vTextField?.font = .fontMedium(size: 17)
        self.vTextField?.delegate = self
        self.addSubview(vTextField!)
        
        self.separatorView = UIView(frame: CGRect(x: 14, y: height-1, width: width-28, height: 1))
        self.separatorView?.backgroundColor = .colorFromHex("CACACA")
        
        self.addSubview(separatorView!)
        
        let bt = UIButton(frame: andFrame)
        self.addSubview(bt)
        self.sendSubviewToBack(bt)
        let wSelf = self
        
        bt.addAction {
            if wSelf.vTextField!.isFirstResponder {
                wSelf.vTextField!.resignFirstResponder()
            } else {
                wSelf.vTextField!.becomeFirstResponder()
            }
        }
        
        self.validateCharater()
    }
    
    init?(newInputViewWithTitle title: String?, andType: InputType, andIsRequired: Bool, confirmBtnLbl: String, andFrame: CGRect, callback: @escaping () -> Void) {
        
        super.init(frame: andFrame)
        let width = andFrame.size.width
        let height = frame.size.height
        self.backgroundColor = .white
        typeInput = andType
        selfPadding = 14
        self.titleLabel = UILabel(frame: CGRect(x: 14, y: 10, width: width - 28, height: height/2 - 11))
        self.titleLabel?.font = .fontMedium(size: 13)
        let titleStr = andIsRequired ? "\(title!)*" : title
        let string = NSMutableAttributedString(string: titleStr!)
        
        if andIsRequired {
            string.addAttribute(.foregroundColor, value: UIColor.colorFromHex("919191"), range: NSRange(location: 0, length: titleStr!.count - 1))
            string.addAttribute(.foregroundColor, value: UIColor.colorFromHex("FF5C22"), range: NSRange(location: titleStr!.count - 1, length: 1))
        } else {
            string.addAttribute(.foregroundColor, value: UIColor.colorFromHex("919191"), range: NSRange(location: 0, length: titleStr!.count))
        }
        
        self.titleLabel?.attributedText = string
        self.titleLabel?.numberOfLines = 0
        self.addSubview(self.titleLabel!)
        
        self.vTextField = UITextField(frame: CGRect(x: 14, y: height/2 - 1, width: width - 28, height: height/2 - 5))
        self.vTextField?.textColor = .black
        self.vTextField?.font = .fontMedium(size: 17)
        self.vTextField?.delegate = self
        self.addSubview(vTextField!)
        
        self.separatorView = UIView(frame: CGRect(x: 14, y: height-1, width: width-28, height: 1))
        self.separatorView?.backgroundColor = .colorFromHex("CACACA")
        
        self.addSubview(separatorView!)
        
        let bt = UIButton(frame: andFrame)
        self.addSubview(bt)
        self.sendSubviewToBack(bt)
        let wSelf = self
        
        let confirmBtn = OPButton(initConfirmBtn: confirmBtnLbl, andFrame: CGRect(x: self.xRight - 77 - 14, y: self.y + 20, width: 77, height: 24))
        self.addSubview(confirmBtn)

        confirmBtn.addAction {
            callback()
        }
        
        bt.addAction {
            if wSelf.vTextField!.isFirstResponder {
                wSelf.vTextField!.resignFirstResponder()
            } else {
                wSelf.vTextField!.becomeFirstResponder()
            }
        }
        
        self.validateCharater()
    }

    
    
    private func validateCharater() {
        switch typeInput {
        case .INPUT_TYPE_NUMBER:
            max_length = 10
            vTextField!.keyboardType = .numberPad
        case .INPUT_TYPE_NAME:
            break
        case .INPUT_TYPE_EMAIL:
            max_length = 256
            vTextField!.keyboardType = .emailAddress
        default:
            break
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func setUpView(title: String?, andType: InputType, andIsRequired: Bool) {
        
        let width = frame.size.width
        let height = frame.size.height
        self.backgroundColor = .white
        typeInput = andType
        selfPadding = 14
        self.titleLabel = UILabel(frame: CGRect(x: 14, y: 10, width: width - 28, height: height/2 - 11))
        self.titleLabel?.font = .fontMedium(size: 13)
        let titleStr = andIsRequired ? "\(title!)*" : title
        let string = NSMutableAttributedString(string: titleStr!)
        
        if andIsRequired {
            string.addAttribute(.foregroundColor, value: UIColor.colorFromHex("919191"), range: NSRange(location: 0, length: titleStr!.count - 1))
            string.addAttribute(.foregroundColor, value: UIColor.colorFromHex("FF5C22"), range: NSRange(location: titleStr!.count - 1, length: 1))
        } else {
            string.addAttribute(.foregroundColor, value: UIColor.colorFromHex("919191"), range: NSRange(location: 0, length: titleStr!.count))
        }
        
        self.titleLabel?.attributedText = string
        self.titleLabel?.numberOfLines = 0
        self.addSubview(self.titleLabel!)
        
        self.vTextField = UITextField(frame: CGRect(x: 14, y: height/2 - 1, width: width - 28, height: height/2 - 5))
        self.vTextField?.textColor = .black
        self.vTextField?.font = .fontMedium(size: 17)
        self.vTextField?.delegate = self
        self.addSubview(vTextField!)
        
        self.separatorView = UIView(frame: CGRect(x: 14, y: height-1, width: width-28, height: 1))
        self.separatorView?.backgroundColor = .colorFromHex("CACACA")
        
        self.addSubview(separatorView!)
        
        let bt = UIButton(frame: frame)
        self.addSubview(bt)
        self.bringSubviewToFront(bt)
        let wSelf = self
        print(bt.frame)
        bt.addAction {
            if wSelf.vTextField!.isFirstResponder {
                wSelf.vTextField!.resignFirstResponder()
            } else {
                wSelf.vTextField!.becomeFirstResponder()
            }
        }
        
        self.validateCharater()
    }
    
    
}

extension OPTextInputView: UITextFieldDelegate {
        
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let str: String
        if let text = textField.text, let swiftRange = Range(range, in: text) {
            str = text.replacingCharacters(in: swiftRange, with: string)
        } else {
            str = string
        }
    
        if self.max_length > 0 {
            if str.count > self.max_length {
                return false
            }
        }
        
        if typeInput == .INPUT_TYPE_NAME {
            textField.text = self.remove_special_char(str)
            if (!self.mustUppercase) {
                textField.text = textField.text?.uppercased();
            }
            DispatchQueue.main.async {
                textField.selectedTextRange = textField.textRange(from: textField.endOfDocument, to: textField.endOfDocument)!
               }
            return false
        }
        
        if typeInput == .INPUT_TYPE_EMAIL {
            textField.text = self.disagreeChar(str, type: .INPUT_TYPE_EMAIL)
            return false
        }
        
        
        return true
    }
}

extension OPTextInputView {
    
    func disagreeChar(_ str: String, type: InputType) -> String {
        let unfilteredString = bo_dau_Tieng_Viet(str)
        var notAllowedChars: CharacterSet?
        switch type {
        case .INPUT_TYPE_NOTE:
            break
        case .INPUT_TYPE_NAME:
            break
        case .INPUT_TYPE_EMAIL:
            
        notAllowedChars = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_.-@").inverted
            
            
        case .INPUT_TYPE_PHONE:
            break
        case .INPUT_TYPE_NUMBER:
            break
        }
        
        let resultString = unfilteredString!.components(separatedBy: notAllowedChars!).joined(separator: " ")
        let trimmedString = trimSpace(resultString)
        return trimmedString ?? ""
    }
    
    func bo_dau_Tieng_Viet(_ str: String?) -> String? {
        var vn = str?.replacingOccurrences(of: "đ", with: "d")
        vn = vn?.replacingOccurrences(of: "Đ", with: "D")
        let data = vn?.data(using: .ascii, allowLossyConversion: true)
        var en: String? = nil
        if (data != nil) {
            en = String(data: data!, encoding: .ascii)
        }
        return en
    }
    
    func remove_special_char(_ str: String) -> String {
        
        let unfilteredString = bo_dau_Tieng_Viet(str)
        let notAllowedChars = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").inverted
        let resultString = unfilteredString!.components(separatedBy: notAllowedChars).joined(separator: " ")
        let trimmedString = trimSpace(resultString)
        
        return trimmedString ?? ""
       
    }
    
    func trimSpace(_ str: String?) -> String? {
        var trimmedString = str
        while (trimmedString as NSString?)?.range(of: "  ").location != NSNotFound {
            trimmedString = trimmedString?.replacingOccurrences(of: "  ", with: " ")
        }
        return trimmedString
    }
    
    func validateEmail() -> Bool? {
        if !(self.vTextField?.text?.isValidEmail)! {
            return false
        }
        return true
    }
    
    func setPlaceholder(_ Placeholder: String!) {
        self.vTextField!.attributedPlaceholder = NSAttributedString(string: "\(Placeholder!)",attributes: [NSAttributedString.Key.foregroundColor: UIColor.cgRGB(rgb: "234 234 234")])
    }
}
