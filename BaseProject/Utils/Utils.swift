//
//  Utils.swift
//  BaseProject
//
//  Created by VPN on 16/06/18.
//  Copyright © 2018 VPN. All rights reserved.
//

import UIKit
import CDAlertView
import SideMenuSwift

class Utils: NSObject {
    
    
    func displayAlert(strMessage:NSString,simple:Bool, vc:UIViewController)
    {
        
        if(simple)
        {
            let alert = UIAlertController(title: Constant.appName, message: strMessage as String, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            vc.present(alert, animated: true, completion: nil)
        }
        else
        {
            let alert = CDAlertView(title: Constant.appName, message: strMessage as String, type: .notification)
            let action = CDAlertViewAction(title: "Ok")
            alert.isTextFieldHidden = true;
            alert.add(action: action)
            alert.hideAnimations = { (center, transform, alpha) in
                transform = .identity
                alpha = 0
            }
            
            alert.show() { (alert) in
                print("completed")
            }
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidPhone(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    func addLeftViewToTextFeild (textFeild : UITextField , image:UIImage , strPlaceHolder:String,padding:CGFloat)
    {
        let leftImageView = UIImageView()
        leftImageView.contentMode = .scaleAspectFit
        
        let leftView = UIView()
        
        leftView.frame = CGRect(x: 0, y: 0, width: padding, height: textFeild.frame.size.height)
        leftImageView.frame = CGRect(x: 13, y: 0, width: 15, height: 20)
        textFeild.leftViewMode = .always
        textFeild.leftView = leftView
        
        leftImageView.image = image
        leftImageView.tintColor = UIColor(red: 106/255, green: 79/255, blue: 131/255, alpha: 1.0)
        leftImageView.tintColorDidChange()
        
        leftView.addSubview(leftImageView)
        
        textFeild.leftViewMode = UITextFieldViewMode.always
        
        textFeild.leftView = leftView;

    }
    
    func setupSideMenu()
    {
        SideMenuController.preferences.basic.menuWidth = 240
        SideMenuController.preferences.basic.statusBarBehavior = .hideOnMenu
        SideMenuController.preferences.basic.position = .sideBySide
        SideMenuController.preferences.basic.direction = .left
        SideMenuController.preferences.basic.enablePanGesture = true
        SideMenuController.preferences.basic.enablePanGesture = true
    }
    
    func SetUpRootVCWithSideMenu()
    {
        setupSideMenu()
        
        let homevc = HomeVC.init(nibName: "HomeVC", bundle: nil)
        let menuVC = LeftMenuVC.init(nibName: "LeftMenuVC", bundle: nil)

        let contentViewController = homevc
        let menuViewController = menuVC
       
        
        let nav = UINavigationController(rootViewController: homevc)
        
        let sideMenuController = SideMenuController(contentViewController: contentViewController, menuViewController: menuViewController)
        
        UIApplication.shared.keyWindow?.rootViewController = sideMenuController
    }
    
}
