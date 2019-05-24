//
//  Constant.swift
//  BaseProject
//
//  Created by VPN on 16/06/18.
//  Copyright © 2018 VPN. All rights reserved.
//

import UIKit
import CDAlertView

class Constant: NSObject {
    static let appName = "Base Demo Application"
    static let BASE_URL = ""
    static let SUB_DOMAIN = "";
    static let Basic_authentication_username = "admin"
    static let Basic_authentication_password = "1234"
    
    
    static let URL_SIGNUP = "";
    static let URL_SIGNIN = "";
    static let URL_CHANGE_PASSWORD = "";
    static let URL_FORGOT_PASSWORD = "";

    static let appDelObject = UIApplication.shared.delegate as! AppDelegate

    
    static let GOOGLE_CLIENT_ID = "369061996480-ci9fuh9odn8u8qkp1n5oe0g5c2c0etrf.apps.googleusercontent.com";
    
    
    static let FacebookID = "255621891664711";
    
    static let FONT_MEDIUM = UIFont(name: "Arial", size: 16)
   
    static let apcolor = UIColor(red: 23.0/255.0, green: 134.0/255.0, blue: 193.0/255.0, alpha: 1.0);
    
    static let backgroundColor = UIColor(red: 23.0/255.0, green: 134.0/255.0, blue: 193.0/255.0, alpha: 1.0);

    static let buttonColorDark = UIColor(red: 23.0/255.0, green: 134.0/255.0, blue: 193.0/255.0, alpha: 1.0);
    
    static let buttonColorLight = UIColor(red: 23.0/255.0, green: 134.0/255.0, blue: 193.0/255.0, alpha: 1.0);
    
    static let navigationBarColor = UIColor(red: 23.0/255.0, green: 134.0/255.0, blue: 193.0/255.0, alpha: 1.0);
    
    static let textColor = UIColor(red: 23.0/255.0, green: 134.0/255.0, blue: 193.0/255.0, alpha: 1.0);

    static let textColorSelected = UIColor(red: 23.0/255.0, green: 134.0/255.0, blue: 193.0/255.0, alpha: 1.0);

    static let textColorNonSelected = UIColor(red: 23.0/255.0, green: 134.0/255.0, blue: 193.0/255.0, alpha: 1.0);
    
    static let app_bg_image = UIImage.init(contentsOfFile: "");
    static let app_default_image = UIImage.init(contentsOfFile: "")
    static let app_textfeild_bg_image = UIImage.init(contentsOfFile: "")
    static let app_button_bg_image = UIImage.init(contentsOfFile: "")
    static let app_navigationbar_header_image = UIImage.init(contentsOfFile: "")

    
    
       
    

}

extension String {
    
    func localized(withComment comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
    
}
