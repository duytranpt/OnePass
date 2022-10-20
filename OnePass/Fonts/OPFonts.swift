//
//  OPFonts.swift
//  OnePass
//
//  Created by Duy Tran on 19/10/2022.
//

import UIKit

class OPFonts: UIFont {
    
    static func fontBold(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "SFProDisplay-Bold", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
    
    static func fontBoldItalic(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "SFProDisplay-BoldItalic", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }

    static func fontMedium(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "SFProDisplay-Medium", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
    
    static func fontMediumItalic(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "SFProDisplay-MediumItalic", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
    
    static func fontRegular(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "SFProDisplay-Regular", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
    
    static func fontRegularItalic(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "SFProDisplay-RegularItalic", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
}

extension UIFont {

}
