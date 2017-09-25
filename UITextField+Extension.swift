//
//  TextField+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/22/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit


let TEXTFIELD_BORDER_COLOR = UIColor.red

extension UITextField{
  //set underline on textfield
  func underline(color:UIColor) {
    self.layoutIfNeeded()
    self.borderStyle = .none
    self.layer.backgroundColor = UIColor.white.cgColor
    self.layer.masksToBounds = false
    self.layer.shadowColor = color.cgColor
    self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
    self.layer.shadowOpacity = 1.0
    self.layer.shadowRadius = 0.0
  }
  
  //set cornerRadius
  func cornerRadius(){
    self.layoutIfNeeded()
    self.layer.cornerRadius = self.frame.height / 2
    self.clipsToBounds = true
  }
  
  //set bordercolor
  func borderColor(){
      self.layer.borderColor = TEXTFIELD_BORDER_COLOR.cgColor
      self.layer.borderWidth = 1.0
  }
  
  //set borderWidth
  func borderWidth(size:CGFloat){
    self.layer.borderWidth = size
  }
  
  //check textfield is blank
  func blank() -> Bool{
    let strTrimmed = self.text!.trim()//get trimmed string
    if(strTrimmed.characters.count == 0)//check textfield is nil or not ,if nil then return false
    {
      return true
    }
    return false
  }
  
  //set begginning space - left space
  func setLeftPadding(paddingValue:CGFloat) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingValue, height: self.frame.size.height))
    self.leftViewMode = .always
    self.leftView = paddingView
  }
  
  //set end of space
  func setRightPadding(paddingValue:CGFloat){
    let paddingView = UIView(frame: CGRect(x: (self.frame.size.width - paddingValue), y: 0, width: paddingValue, height: self.frame.size.height))
    self.rightViewMode = .always
    self.rightView = paddingView
  }
  
  
  
}
