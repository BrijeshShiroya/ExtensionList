//
//  UIViewController+Extension.swift
//  ExtensionListSwift
//
//  Created by Creole02 on 8/25/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController{
  
  //show basic type alert
  func showAlertWithTitle(strTitle:String, andMessage strMsg:String, andOkButtonTitle okButtonTitle:String)
  {
    let alertViewController = UIAlertController.init(title: strTitle, message: strMsg, preferredStyle: .alert)
    //make UIAlertController instance with title,msg and style
    let okAction = UIAlertAction(title: okButtonTitle, style: .cancel) { (result : UIAlertAction) -> Void in//make action that perform on ok click
    }
    alertViewController.addAction(okAction) //set action into alertcontroller
    self.present(alertViewController, animated: true, completion: nil)
  }
  
  //show alert for 1 seconds
  func showAlertWithTitleForTime(strTitle:String, andMessage strMsg:String, andOkButtonTitle okButtonTitle:String)
  {
    let alertViewController = UIAlertController.init(title: strTitle, message: strMsg, preferredStyle: .alert)
    self.present(alertViewController, animated: true, completion: nil)
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
      alertViewController.dismiss(animated: true, completion: nil)
    })
  }
  
  
  //Function for pop viecontroller if exist in stack of navigation
  func popToViewControllerWithClass(destinationController: UIViewController, andAnimated animated:Bool)
  {
    let arrController:[UIViewController] = (self.navigationController?.viewControllers)!//array of all controllers in navigation stack
    for vc in arrController
    {
      if (type(of: vc)  == type(of: destinationController))//check exist or not
      {
        _ = self.navigationController?.popToViewController((arrController[(arrController.index(of: vc))!]), animated: true)
        break
      }
    }
  }
  //push to other
  func pushToViewControllerWithClass(_ destinationController:UIViewController, andAnimated animated:Bool)
  {
    let arrController = self.navigationController?.viewControllers//array of all controllers in navigation stack
    for vc in arrController!
    {
      if (type(of: vc)  == type(of: destinationController))
      {
        _ = self.navigationController?.popToViewController(arrController![(arrController?.index(of: vc))!], animated: true)
        break
      }
      else
      {
        _ = self.navigationController?.pushViewController(destinationController, animated: animated)
        break
        //if not exist in stack then push
      }
    }
  }
  
  //setup menubar button
  func setupMenuBarButtonItems(isleftButton:Bool, isRightButton:Bool){
    if isleftButton{
      self.navigationItem.leftBarButtonItem =  UIBarButtonItem.init(image: UIImage.init(named: "menu"), style: .plain, target: self, action: #selector(self.leftSideMenuButtonPressed))
    }
    if isRightButton{
      self.navigationItem.rightBarButtonItem =  UIBarButtonItem.init(image: UIImage.init(named: "menu"), style: .plain, target: self, action: #selector(self.rightSideMenuButtonPressed))
    }
  }
  
  func leftSideMenuButtonPressed(){
    print("Pressed left")
  }
  
  func rightSideMenuButtonPressed(){
    print("Pressed right")
  }
  
}
