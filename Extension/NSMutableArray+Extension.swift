//
//  NSMutableArray+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/21/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation

extension NSMutableArray{
  
  //convert dictionary param into mutable copy and make new mutableArray
  func setMutableData() -> NSMutableArray{
    let arrData:NSMutableArray = NSMutableArray()
    for dict in self{
      let dicNew = (dict as! NSDictionary).convertAllValueString()
      arrData.add(dicNew)
    }
    return arrData
  }
  
  //replace value
  func replaceValueWithKey(strKey:String, withValue strValue:String, withUpdatevalue strUpdateValue:String) -> NSMutableArray{
    let arrOfKeyValue = self.value(forKeyPath: strKey) as! NSArray// get data of all Key
    if arrOfKeyValue.contains(strValue){
      let indexOfValue = arrOfKeyValue.index(of: strValue)//getIndex
      let dic = self[indexOfValue] as! NSMutableDictionary
      dic[strKey] = strUpdateValue
    }
    return self
  }
  //replace object
  func replaceObjectWithKey(strKey:String, withValue strValue:String, withUpdateObject dicObject:NSMutableDictionary) -> NSMutableArray{
    let arrOfKeyValue = self.value(forKeyPath: strKey) as! NSArray // get data of all Key
    if arrOfKeyValue.contains(strValue){
      let indexOfValue = arrOfKeyValue.index(of: strValue)//getIndex
      self.replaceObject(at: indexOfValue, with: dicObject)
    }
    return self
  }
  
  //insert object to first
  func addFirstObject(dicObject:NSMutableDictionary) -> NSMutableArray{
    self.insert(dicObject, at: 0)
    return self
  }
  
  //Insert object to last
  func addLastObject(dicObject:NSMutableDictionary) -> NSMutableArray{
    self.insert(dicObject, at: self.count)
    return self
  }

  
  //Insert object to specific value of object at particular position
  func insertObjectToUpAndDown(strKey:String, withValue strValue:String, withNewObject dicObject:NSMutableDictionary,positionUp:Bool) -> NSMutableArray{
    let arrOfKeyValue = self.value(forKeyPath: strKey) as! NSArray// get data of all Key
    if arrOfKeyValue.contains(strValue){
      let indexOfValue = arrOfKeyValue.index(of: strValue)//getIndex
      if positionUp{
        self.insert(dicObject, at: indexOfValue)
      }else{
        self.insert(dicObject, at: indexOfValue + 1)
      }
    }
    return self
  }

  //delete object using key-value
  func deleteByObjectUsingKeyValue(strKey:String, withValue strValue:String) -> NSMutableArray{
    let arrOfKeyValue = self.value(forKeyPath: strKey) as! NSArray // get data of all Key
    if arrOfKeyValue.contains(strValue){
      let indexOfValue = arrOfKeyValue.index(of: strValue)//getIndex
      self.removeObject(at: indexOfValue)
    }
    return self
  }
  
  
  //sorting into ascending array
  override func ascendingArray() -> NSMutableArray{
    let a = self as! [Any]
    let arr = a.sorted(by: { ($0 as AnyObject).localizedCaseInsensitiveCompare(($1 as AnyObject) as! String) == .orderedAscending
    })
    return NSMutableArray.init(array: arr)
  }
 
  
  //sorting into descending array
  override func descendingArray() -> NSMutableArray{
    let a = self as! [Any]
    let arr = a.sorted(by: { ($0 as AnyObject).localizedCaseInsensitiveCompare(($1 as AnyObject) as! String) == .orderedDescending
    })
    return NSMutableArray.init(array: arr)
  }
  
  //sorting - ascending/descending
  override func SortingArrayWithKeyValue(key:String,ascending:Bool) -> NSMutableArray{
    let ns = NSSortDescriptor.init(key: key, ascending: ascending)
    let aa = NSArray(object: ns)
    let arrResult = self.sortedArray(using: aa as! [NSSortDescriptor])
    return arrResult as! NSMutableArray
  }
  
  
  //Remove duplicate key value of object
  override func removeDuplicateObjectByKey(key:String) -> NSMutableArray{
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
  
  //remove duplicates value and return new NSArray
  override func removeDuplicateObject() -> NSMutableArray{
    let orderedSet = NSSet.init(array: self as! [Any])
    let arrayWithoutDuplicates = NSMutableArray.init(array:(orderedSet.allObjects))
    return arrayWithoutDuplicates
  }
  
  //convert array to string
  override func convertToString() -> String{
    let strJoin = self.componentsJoined(by: " ")
    return strJoin
  }
  
  //Remove key and Replace key value
  func removeReplceKey(strKey:String, isRemove:Bool) -> NSMutableArray{
      let arrData = NSMutableArray()
    //get akk 
    for dictionary in self{
      var dicData = NSMutableDictionary()
      dicData = (dictionary as! NSDictionary).mutableCopy() as! NSMutableDictionary
      if isRemove{
        dicData.removeObject(forKey: strKey)
      }else{
        dicData[strKey] = ""
      }
      arrData.add(dicData)
    }
    return arrData
  }
}
