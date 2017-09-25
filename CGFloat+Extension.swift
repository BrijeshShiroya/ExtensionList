//
//  CGFloat+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/22/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat{
  //get proportional width related to screen heigth
    func getProprtionalHeight() -> CGFloat{
      return (SCREEN_HEIGHT * self) / 568.0
    }
  
  //get proportional width related to screen width
    func getProprtionalWidth() -> CGFloat{
      return (SCREEN_WIDTH * self) / 320.0
    }
  
  //get proportional with to other
  //how to use it? = actualSize --- self
//                   toRelatedSize --  ??
  func proportionalSizeRelatedToOther(actualSize: CGFloat, toRelatedSize:CGFloat) -> CGFloat{
    return (toRelatedSize * self) / actualSize
  }
}

/*
 //function for getting expectedsize based on screen to argumented size
 func PROPORTIONAL_SIZE(actualSize:CGFloat, withConvertedSize convertedSize:CGFloat, toRelatedSize relatedSize:CGFloat) -> CGFloat
 {
  }
 */
