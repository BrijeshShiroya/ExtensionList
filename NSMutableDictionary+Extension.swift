
//
//  NSMutableDictionary+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/21/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit

let KEY_OS_TYPE = "osType"
let KEY_VERSION = "bundleVersion"
let KEY_S_VERSION = "systemVersion"
let KEY_S_MODEL = "deviceModel"

extension NSMutableDictionary{
  //Remove key and replace key value
  
 class func indexingByKey(strKey:String, currentArray arrayObject:NSMutableArray) -> NSMutableDictionary{
    let dicMain:NSMutableDictionary = NSMutableDictionary()
    
    for dictionary in arrayObject{
        let dic = dictionary as! NSMutableDictionary
        let strFirstChar = "\(((dic[strKey] as! String).characters.first!))".uppercased()
      // Here we need to check for key

      let arrAllKey:NSArray = dicMain.allKeys as NSArray
      if !arrAllKey.contains(strFirstChar){
        dicMain.setObject(NSMutableArray(), forKey: strFirstChar as NSCopying)
      }
        // Here we need to get object from key and add new into it
        var arrCurrentChar = dicMain.object(forKey: strFirstChar) as! NSMutableArray
        if arrCurrentChar.count == 0{
          arrCurrentChar = NSMutableArray.init()
      }
        arrCurrentChar.add(dic)
        // Here we need to reset the dic value
        dicMain.setObject(arrCurrentChar, forKey: strFirstChar as NSCopying)
    }
    return dicMain
  }
    //set default parameter
  class func setDefaultPara(dic:NSMutableDictionary) -> NSMutableDictionary{
    dic[KEY_OS_TYPE] = "1"
    dic[KEY_VERSION] = Bundle.main.infoDictionary!["CFBundleVersion"]//return build version
    dic[KEY_S_VERSION] = UIDevice.current.systemVersion
    dic[KEY_S_MODEL] = UIDevice.current.modelName
    return dic
  }
}
