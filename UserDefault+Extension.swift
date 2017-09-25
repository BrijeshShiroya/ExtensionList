//
//  UserDefalut+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/23/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit


let USERDEFAULTS = UserDefaults.standard

extension UserDefaults {
  //convert into string and store into userdefaults
  class func setValue(dictionary:NSDictionary){
    for (key1,value1) in dictionary{
      let k = "\(key1)"
      let value = "\(value1)"
      USERDEFAULTS.set(value, forKey: k)//set login dic into userdefault
    }
  }
  
  //set all value into userdefault by particluar key
  class func setValueByType(dic:NSDictionary){
    for (key,value) in dic{
      let resultKey = key as! String
      let resultValue = value
      USERDEFAULTS.set(resultValue, forKey: resultKey)
    }
  }
  
  //remove value
  class func removeValue(key:String){
    USERDEFAULTS.removeObject(forKey: key)
  }
  
  //Function remove all key from userdefaults
  class func clearUserDefaultAllKey()
  {
    for Key in USERDEFAULTS.dictionaryRepresentation().keys
    {
      USERDEFAULTS.removeObject(forKey: Key)
    }
  }
}



