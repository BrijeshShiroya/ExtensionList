//
//  Date+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/22/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation

let YYYY_MM_DD_HH_MM_SS_zzzz = "yyyy-MM-dd HH:mm:ss +zzzz"
let YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss"
let DD_MM_YYYY = "dd-MM-yyyy"
let MM_DD_YYYY = "MM-dd-yyyy"
let YYYY_DD_MM = "yyyy-dd-MM"
let YYYY_MM_DD_T_HH_MM_SS = "yyyy-MM-dd'T'HH:mm:ss"

//"2017-07-31T05:12:17.36"



extension Date{
  
  //convert string to date
  static func convertStringToDate(strDate:String, dateFormate strFormate:String) -> Date{
    let dateFormate = DateFormatter()
    dateFormate.dateFormat = strFormate
    dateFormate.timeZone = TimeZone.init(abbreviation: "UTC")
    let dateResult:Date = dateFormate.date(from: strDate)!
    
    return dateResult
  }
  
  //Function for old date format to new format from UTC to local
  static func convertDateUTCToLocal(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
    let dateFormatterUTC:DateFormatter = DateFormatter()
    dateFormatterUTC.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone!//set UTC timeZone
    dateFormatterUTC.dateFormat = strOldFormate //set old Format
    if let oldDate:Date = dateFormatterUTC.date(from: strDate)  as Date?//convert date from input string
    {
      dateFormatterUTC.timeZone = NSTimeZone.local//set localtimeZone
      dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
      if let strNewDate:String = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
      {
        return strNewDate
      }
      return strDate
    }
    return strDate
  }
  
  //Convert without UTC to local
  static func convertDateToLocal(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
    let dateFormatterUTC:DateFormatter = DateFormatter()
    //set local timeZone
    dateFormatterUTC.dateFormat = strOldFormate //set old Format
    if let oldDate:Date = dateFormatterUTC.date(from: strDate) as Date?//convert date from input string
    {
      dateFormatterUTC.timeZone = NSTimeZone.local
      dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
      if let strNewDate = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
      {
        return strNewDate
      }
      return strDate
    }
    return strDate
  }
  
  //Convert Date to String
  func convertDateToString(strDateFormate:String) -> String{
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = strDateFormate
      let strDate = dateFormatter.string(from: self)
//      dateFormatter = nil
      return strDate
  }
  
  
  static func timeDifference(strFrom:String, toTime:String) -> String
  {
    //convert strDateUTC into date
    var dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone!
    let dateStart = dateFormatter.date(from: strFrom)
    let dateEnd = dateFormatter.date(from: toTime)
    //convert date into dd-MM-yyyy HH:mm a(12/11/2016 11:45 AM)
    dateFormatter.dateFormat = "dd-MM-yyyy HH:mm a"
    
    dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
    //get startdate and enddate-enddate is current dateand time
    let strDate1 = dateFormatter.string(from: dateStart!)
    let strDate2 = dateFormatter.string(from: dateEnd!)
    let startDate:Date = dateFormatter.date(from: strDate1)!
    let endDate:Date = dateFormatter.date(from: strDate2)!
    
    //find difference between start and enddate
    let dif = endDate.timeIntervalSince(startDate)
    
    let minutes = dif / 60
    print(minutes)
    
    let hours = minutes/60
    print(hours)
    
    let day = minutes / 1440
    
    var strResult = ""
    if (Int(day) <= 0)//if day lessthan 0 or equal 0
    {
      if (Int(minutes) <= 0)//if seconds lessthan 0 then strResult is fewSecond
      {
        strResult = "fewSecond"
      }
      else if(Int(hours) <= 0)//if hours lessthan 0 and
      {
        if (Int(minutes) <= 1)//if minutes less than 1 or equal 1
        {
          strResult = "\(Int(minutes)) min"
        }
        else
        {
          strResult = "\(Int(minutes)) mins"
        }
      }
      else
      {
        if (Int(hours) == 24) //if hours ==24 then it is 1 day
        {
          strResult = "1 day"
        }
        else if (Int(hours) <= 1)//if hours isequal 1 or less
        {
          strResult = "\(Int(hours)) hour"
        }
        else
        {
          strResult = "\(Int(hours)) hours"
        }
      }
    }
    else
    {
      let dfResult = DateFormatter()
      dfResult.dateFormat = "dd/MM/yyyy HH:mm a"
      strResult = dfResult.string(from: startDate)//convert into dd/MM/yyyy HH:mm a formate and get string from startdate and storeinto strResult
    }
    print("output::\(strResult)")
    return strResult
  }
 
  //Convert local to utc
  static func convertLocalToUTC(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
    let dateFormatterUTC:DateFormatter = DateFormatter()
    dateFormatterUTC.timeZone = NSTimeZone.local as TimeZone!//set UTC timeZone
    dateFormatterUTC.dateFormat = strOldFormate //set old Format
    if let oldDate:Date = dateFormatterUTC.date(from: strDate)  as Date?//convert date from input string
    {
      dateFormatterUTC.timeZone = NSTimeZone.init(abbreviation: "UTC")! as TimeZone//set localtimeZone
      dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
      if let strNewDate:String = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
      {
        return strNewDate
      }
      return strDate
    }
    return strDate
  }
  
  //Comparison two date
  static func compare(date:Date, compareDate:Date) -> String{
    var strDateMessage:String = ""
    let result:ComparisonResult = date.compare(compareDate)
    switch result {
    case .orderedAscending:
      strDateMessage = "Future Date"
      break
    case .orderedDescending:
      strDateMessage = "Past Date"
      break
    case .orderedSame:
      strDateMessage = "Same Date"
      break
    default:
      strDateMessage = "Error Date"
      break
    }
    return strDateMessage
  }
  
  
  
  
}
