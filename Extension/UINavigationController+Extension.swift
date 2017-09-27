//
//  UINavigationController.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/23/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController{
  //set navigationbar title
  func setTitle(strTitle:String){
    let lblTitle = UILabel()
    lblTitle.text = strTitle
    lblTitle.backgroundColor = UIColor.clear
    lblTitle.textColor = UIColor.navigationBarTextColor
    lblTitle.font = UIFont.navigationBarFont
    lblTitle.sizeToFit()
    self.topViewController?.navigationItem.titleView = lblTitle
    self.topViewController?.navigationController?.navigationBar.barTintColor = UIColor.navigationBarColor
  }
}

