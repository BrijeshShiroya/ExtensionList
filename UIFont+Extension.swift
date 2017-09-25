//
//  UIFont+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/17/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit
/*
 - Font size and family
 - Font size
 - Font Family
 - Make bold font
 - Make italic font
 - Make scaled font = Return scaled version of font
 - Make Preferred custom font
 - Check font type available or not
 */

let APP_FONT_NAME = "Avenir"
let NAV_FONT_NAME = "Courier"

let APP_FONT_SIZE = 17.0
let NAV_FONT_SIZE = 15.0

extension UIFont{
  //application main font
  class var applicationFont:UIFont{
    let appFont = UIFont.init(name: APP_FONT_NAME, size: CGFloat(APP_FONT_SIZE))
    return appFont!
  }
  
  //navigation main font
  class var navigationBarFont:UIFont{
    let navFont = UIFont.init(name: NAV_FONT_NAME, size: CGFloat(NAV_FONT_SIZE))
    return navFont!
  }
  
  //change font using fontname and size
  class func getFontByNameAndSize(fontFamily:String, fontSize:CGFloat) -> UIFont{
    if UIFont.familyNames.contains(fontFamily){
      return UIFont.init(name: fontFamily, size: fontSize)!
    }
    return UIFont.systemFont(ofSize: fontSize)
  }
  
  // Returns a scaled version of UIFont
  func scaled(scaleFactor: CGFloat) -> UIFont {
    let newDescriptor = fontDescriptor.withSize(fontDescriptor.pointSize * scaleFactor)
    return UIFont(descriptor: newDescriptor, size: 0)
  }
  
  //change fontsize using fonttextstyle
  func preferredFontForTextStyle(style: UIFontTextStyle) -> UIFont {
    switch(style) {
    case UIFontTextStyle.body:
      return UIFont.systemFont(ofSize: 17)
    case UIFontTextStyle.headline:
      return UIFont.systemFont(ofSize: 17)
    case UIFontTextStyle.subheadline:
      return UIFont.systemFont(ofSize: 15)
    case UIFontTextStyle.footnote:
      return UIFont.systemFont(ofSize: 13)
    case UIFontTextStyle.caption1:
      return UIFont.systemFont(ofSize: 12)
    case UIFontTextStyle.caption2:
      return UIFont.systemFont(ofSize: 11)
    default:
      return UIFont.systemFont(ofSize: 17)
    }
  }
  
}
