//
//  Array+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/21/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation

/*
 - Array to convert mutable copy - ok
 - Remove duplicate - ok
 - Array to string
 - Replace Array
 - Empty - remove
 - Sorting (normal, asending, desending, array )
 - Add Objects (particular index add object)
 - Remove object from array with specific value
 */


extension NSArray{
  //convert mutable copy
  func toMutableCopy() -> NSMutableArray{
    let resultArray = NSMutableArray.init(array: self)
    return resultArray
  }
  
  //remove duplicates value and return new NSArray
  func removeDuplicateObject() -> NSArray{
    let orderedSet = NSSet.init(array: self as! [Any])  // => [ "y", "x" ]
    let arrayWithoutDuplicates = NSArray.init(array:(orderedSet.allObjects))
    return arrayWithoutDuplicates
  }
  
  
  //Remove duplicate key value of object
  func removeDuplicateObjectByKey(key:String) -> NSArray{
    let tempValues = NSMutableSet.init()
    let retData = NSMutableArray()
    for obj in self{
      if !tempValues.contains((obj as! NSDictionary).value(forKey: key)!){
        tempValues.add((obj as! NSDictionary).value(forKey: key)!)
        retData.add(obj)
      }
    }
    return retData
  }
  
  //convert array to string
  func convertToString() -> String{
    let strJoin = self.componentsJoined(by: " ")
    return strJoin
  }
  
  //sorting into ascending array
  func ascendingArray() -> NSArray{
    let a = self as! [Any]
    let arr = a.sorted(by: { ($0 as AnyObject).localizedCaseInsensitiveCompare(($1 as AnyObject) as! String) == .orderedAscending
    })
    return NSArray.init(array: arr)
  }
 
  
  //sorting into descending array
  func descendingArray() -> NSArray{
    let a = self as! [Any]
    let arr = a.sorted(by: { ($0 as AnyObject).localizedCaseInsensitiveCompare(($1 as AnyObject) as! String) == .orderedDescending
    })
    return NSArray.init(array: arr)
  }
  
  //sorting- ascending
  func SortingArrayWithKeyValue(key:String , ascending:Bool) -> NSArray{
    let ns = NSSortDescriptor.init(key: key, ascending: ascending)
    let aa = NSArray(object: ns)
    let arrResult = self.sortedArray(using: aa as! [NSSortDescriptor])
    return arrResult as NSArray
  }
}
