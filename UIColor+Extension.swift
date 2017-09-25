//
//  UIColor+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/18/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit


let MAIN_COLOR = UIColor.init(red: 1.0/255.0, green: 182.0/255.0, blue: 156.0/255.0, alpha: 1.0)
let MAIN_FONT_COLOR = UIColor.init(red: 1.0/255.0, green: 182.0/255.0, blue: 156.0/255.0, alpha: 1.0)
let PLACEHOLDE_COLOR = UIColor.init(red: 1.0/255.0, green: 182.0/255.0, blue: 156.0/255.0, alpha: 1.0)
let NAVIGATIONBAR_COLOR = UIColor.init(red: 1.0/255.0, green: 182.0/255.0, blue: 156.0/255.0, alpha: 1.0)
let NAVIGATIONBAR_TEXT_COLOR = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)

extension UIColor{
  
  //return application Main theme color
  class var mainColor:UIColor{
    return MAIN_COLOR
  }
  
  //return application main text color
  class var mainFontColor:UIColor{
    return MAIN_FONT_COLOR
  }
  
  //return placeholder text color
  class var placeholderColor:UIColor{
    return PLACEHOLDE_COLOR
  }
  
  //return navigation background or text color
  class var navigationBarColor:UIColor{
    return NAVIGATIONBAR_COLOR
  }
  
  class var navigationBarTextColor:UIColor{
    return NAVIGATIONBAR_TEXT_COLOR
  }

  //get new color from rgb value
  class func RGB(_ red:CGFloat , andGreenColor green:CGFloat, andBlueColor blue:CGFloat, withAlpha alpha:CGFloat) -> UIColor
  {
    let color = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    return color
  }
  
  //return color from comma separated string of RGB paramater
  convenience init(rgbString :String, alpha:CGFloat = 1.0){
    let arrColor = rgbString.components(separatedBy: ",")
    let red:CGFloat = CGFloat(NumberFormatter().number(from: arrColor[0])!)
    let green:CGFloat = CGFloat(NumberFormatter().number(from: arrColor[1])!)
    let blue:CGFloat = CGFloat(NumberFormatter().number(from: arrColor[2])!)
    self.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
  }
  
  //return color from hexadecimal value
  //let color2 = UIColor(rgbHexaValue: 0xFFFFFFFF)
  convenience init(rgbHexaValue: Int, alpha: CGFloat = 1.0) {
    self.init(red:  CGFloat((rgbHexaValue >> 16) & 0xFF), green: CGFloat((rgbHexaValue >> 8) & 0xFF), blue: CGFloat(rgbHexaValue & 0xFF), alpha: alpha)
  }
  
}
