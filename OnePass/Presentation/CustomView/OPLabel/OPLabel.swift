//
//  OPLabel.swift
//  OnePass
//
//  Created by Duy Tran on 26/10/2022.
//

import UIKit

class OPLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func formatText(fullString: NSString, boldPartOfString: [NSString], font: UIFont!, boldFont: UIFont, color: UIColor, underLine: Bool) {
        self.attributedText = setupText(fullString: fullString, boldPartOfString: boldPartOfString, font: font, boldFont: boldFont, color: color, underLine: underLine)
    }
    
    private func setupText(fullString: NSString, boldPartOfString: [NSString], font: UIFont, boldFont: UIFont, color: UIColor, underLine: Bool) -> NSAttributedString {
        
        let nonBoldFontAttribute = [NSAttributedString.Key.font:font]
        let boldString = NSMutableAttributedString(string: fullString as String, attributes:nonBoldFontAttribute)
        
        for i in boldPartOfString {
            let boldFontAttribute = [NSAttributedString.Key.font:boldFont]
            boldString.addAttributes(boldFontAttribute, range: fullString.range(of: i as String))
            let colorAttribute = [NSAttributedString.Key.foregroundColor: color]
            boldString.addAttributes(colorAttribute, range: fullString.range(of: i as String))
            if underLine {
                let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
                boldString.addAttributes(underlineAttribute, range: fullString.range(of: i as String))
            }
        }

        return boldString
    }
    
    func tapAction(key: [NSString], action: @escaping (Int) -> Void) {
        self.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer { recognizer in
            for (index, element) in key.enumerated() {
                let text = (self.text)!
                let termsRange: NSRange = (text as NSString).range(of: element as String)
                let preferredLanguage = NSLocale.preferredLanguages[0]

                if recognizer.didTapAttributedTextInLabel(label: self, inRange: termsRange) {
                    action(index)
                    break
                } 
            }
            
        }
        self.addGestureRecognizer(tapRecognizer)
    }
    
    func text(str: String) {
        self.text = bo_dau_Tieng_Viet(str)
    }
    
}

extension OPLabel {
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
}
