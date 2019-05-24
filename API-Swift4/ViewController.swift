//
//  ViewController.swift
//  API-Swift4
//
//  Created by VPN on 14/06/18.
//  Copyright © 2018 VPN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let dict = NSMutableDictionary();
        dict.setValue("1", forKey: "folder_name");
//        let urlParams = dict.compactMap({ (key, value) -> String in
//            return "\(key)=\(value)"
//        }).joined(separator: "&")
        
        let strURL = "http://clients.vpninfotech.com/dev-saloon/api/v1/branch/checkinList/26";
        
        let apiCall = ServerAPI()
        
        
        apiCall.GET_API_CALL(str: strURL, isApplyToken: false, isAppliedBasicAuthentication: true, dict: dict, queryStr: "", onSuccess: { (json) in
            
            print(json);
            
        }) { (err) in
            print(err);

        }
        
        
//        apiCall.getAPICall(str: strURL, isApplyToken: false, isAppliedBasicAuthentication: true, dict: dict, queryStr: urlParams, onSuccess: { (json) in
//            
//            print("JSON -->",json);
//            
//        }) { (err) in
//            print("ERROR -->",err?.localizedDescription as Any);
//            
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

