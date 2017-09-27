//
//  String+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/18/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit

extension String{
  /*
   - Email validation. - done
   - Mobile number validation. -  done
   - trimming. -  done
   - String to Bool conversion. -  done
   - Finding String length.
   - Check particular string available or not into String. -  done
   - Replace string - done
   - Finding height using string. - done
   - Make attributed string -
   - concatenation of string - done
   - generate random string and number - done
   - String to array - done
   - Convert to encode and decode - done
   - Alphanumeric, numeric - done - done
   - CharacterSet -
   */
  
  //catch path directory
  static func documentDirectory() -> String{
    return (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
  }
  
  //Email Validation
  func isEmailAddress() -> Bool {
    // print("validate calendar: \(testStr)")
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: self)
  }
  
  //Trimming
  //removing whitespace (remove space from leading and trailing  of text)
  func trim() -> String{
    let strTrimmed = (NSString(string:self)).trimmingCharacters(in: CharacterSet.whitespaces)
    return strTrimmed
  }
  
  
  // Mobile Validation
  func isMobile() -> Bool{
    let PHONE_REGEX = "^\\d{10}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    let result =  phoneTest.evaluate(with: self)
    return result
  }
  
  //get height based on text
  func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
    let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
    return boundingBox.height + 24
  }
  
  //convert string to boolean
  func toBool() -> Bool? {
    let str = self.lowercased()
    switch str {
    case "true", "yes", "1":
      return true
    case "false", "no", "0":
      return false
    default:
      return nil
    }
  }
  
  
  //replce oldstring by new string
  func replace(target: String, withString: String) -> String{
    return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
  }
  
  //check text contains or not - remove caseSensivity
  func contains(matchedString:String) -> Bool{
    if((self.range(of: matchedString, options: String.CompareOptions.caseInsensitive, range: nil, locale: nil)) != nil){
      return true
    }else{
      return false
    }
  }
  
  
  //string contains numbers or not
  var isNumeric:Bool{
    let numberRegEx  = ".*[0-9]+.*"
    let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
    return testCase.evaluate(with: self)
  }
  
  //checkalphanumric value or not
  var isAlphaNumeric: Bool {
    return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
  }
  
  //check special character value or not
  var isSpecialCharacter: Bool{
    let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
    if self.rangeOfCharacter(from: characterset.inverted) != nil {
      return true
    }
    return false
  }
  
  //convert string to base64 String
  func encodeFromBase64() -> String? {
    guard let data = Data(base64Encoded: self) else {
      return nil
    }
    return String(data: data, encoding: .utf8)
  }
  
  //convert base64 string to string
  func decodeToBase64() -> String {
    return Data(self.utf8).base64EncodedString()
  }
  
  //convert string into array by character seprated string
  func stringToArray(sepratedString:String) -> [String]{
    return self.components(separatedBy: sepratedString)
  }
  
  //generate random string
  static func randomString(length:Int) -> String {
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)
    
    var randomString = ""
    for _ in 0 ..< length {
      let rand = arc4random_uniform(len)
      var nextChar = letters.character(at: Int(rand))
      randomString += NSString(characters: &nextChar, length: 1) as String
    }
    return randomString
  }
  
  //convert string to CGFloat
  func toCGFloat() -> CGFloat{
    if let n = NumberFormatter().number(from: self.trim()){
      return n as! CGFloat
    }
    return 0
  }
  
  //string to URL
  func toURL() -> URL{
    return URL.init(string: self)!
  }
}
