//
//  NSDictionary+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/21/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation


extension NSDictionary{
  //convert all param into string and return mutablecopy
  func convertAllValueString() -> NSMutableDictionary{
    let dicResult = NSMutableDictionary()
    for (key,value) in self{
      dicResult[key] = "\(value)"
    }
    return dicResult
  }
}
