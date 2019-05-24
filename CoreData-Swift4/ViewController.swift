//
//  ViewController.swift
//  CoreData-Swift4
//
//  Created by VPN on 15/06/18.
//  Copyright © 2018 VPN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let apiCall = ServerAPI()
    let coreData = CoreDataOperation()
    var arr : NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //DELETE FUNCTIONALITY
        coreData.deleteEntity(strEntityName: "Client", predicate: "")
        
        
        //ADD/UPDATE FUNCTIONALITY
        let strURL = "http://clients.vpninfotech.com/dev-saloon/api/v1/branch/checkinList/26";
        saveCustomerToDB(strURL: strURL)
        
       
        
        
    }

    
    func saveCustomerToDB(strURL:String) {
      
        let dict = NSMutableDictionary();

        apiCall.GET_API_CALL(str: strURL, isApplyToken: false, isAppliedBasicAuthentication: true, dict: dict, queryStr: "", onSuccess: { (json) in
            
            print(json);
            
            let arrResponse = NSMutableArray()
            let dictParse = json as? NSDictionary
            var arr = dictParse?.value(forKey: "data") as? NSArray
            for dict in arr!
            {
                let dictM = dict as? NSDictionary
                let pred = String(format: "%@%@%@","appointment_id", "=",(dictM?.value(forKey: "appointment_id") as? String)!)
                let dictNSMutable = NSMutableDictionary(dictionary: dictM!)
                
                arrResponse.add(self.coreData.addRecord(entityName: "Client", predicate: pred, primaryKey: "appointment_id", dict: dictNSMutable));
                
                
            }
            
            //FETCH FUNCTIONALITY
            arr = self.coreData.fetchEntityData(strEntityName: "Client", predicate: "") as? NSArray;
            
            
        }) { (err) in
            print(err?.localizedDescription ?? "empty");
            
        }
    }

}


