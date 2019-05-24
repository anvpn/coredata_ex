//
//  ServerAPI.swift
//  API-Swift4
//
//  Created by VPN on 14/06/18.
//  Copyright © 2018 VPN. All rights reserved.
//

import UIKit
import SystemConfiguration


class ServerAPI: NSObject {
    
    let strUserName = "admin";
    let strPassword = "1234";
    
    
    
    //MARK:- POST_API_CALL
    
    func POST_API_CALL(str : String,isApplyToken:Bool,isAppliedBasicAuthentication:Bool,dict:NSMutableDictionary,queryStr:String, onSuccess success: @escaping (_ JSON: Any) -> Void, onFailure failure: @escaping (_ error: Error?) -> Void)
    {
        
        let urlParams = queryStr;
        var request = URLRequest(url: URL(string: str)!)
        request.httpMethod = "POST"
        
        
        //Authentication
        if(isAppliedBasicAuthentication)
        {
            let loginString = String(format: "%@:%@", strUserName, strPassword)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
            
        }
        
        if(queryStr.count > 0)
        {
            request.httpBody = urlParams.data(using: String.Encoding.utf8)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        else
        {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
                
            } catch let error {
                print(error.localizedDescription)
            }
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        
        callWS(request: request, onSuccess: { (dict) in
            success(dict)
            print(dict);
        }) { (err) in
            print(err?.localizedDescription ?? "");
            failure(err);
        }
        
        
    }
    
    
    //MARK:- GET_API_CALL
    
    func GET_API_CALL(str : String,isApplyToken:Bool,isAppliedBasicAuthentication:Bool,dict:NSMutableDictionary,queryStr:String, onSuccess success: @escaping (_ JSON: Any) -> Void, onFailure failure: @escaping (_ error: Error?) -> Void)
    {
        
        let urlParams = queryStr;
        var request = URLRequest(url: URL(string: str)!)
        request.httpMethod = "GET"
        
        
        //Authentication
        if(isAppliedBasicAuthentication)
        {
            let loginString = String(format: "%@:%@", strUserName, strPassword)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
            
        }
        
        if(queryStr.count > 0)
        {
            request.httpBody = urlParams.data(using: String.Encoding.utf8)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        else
        {
//            do {
//                request.httpBody = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
//                
//            } catch let error {
//                print(error.localizedDescription)
//            }
//            
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        
        callWS(request: request, onSuccess: { (dict) in
            success(dict)
            print(dict);
        }) { (err) in
            print(err?.localizedDescription ?? "");
            failure(err);
        }
        
        
    }
    
    //MARK:- PUT_API_CALL
    
    func PUT_API_CALL(str : String,isApplyToken:Bool,isAppliedBasicAuthentication:Bool,dict:NSMutableDictionary,queryStr:String, onSuccess success: @escaping (_ JSON: Any) -> Void, onFailure failure: @escaping (_ error: Error?) -> Void)
    {
        
        let urlParams = queryStr;
        var request = URLRequest(url: URL(string: str)!)
        request.httpMethod = "PUT"
        
        
        //Authentication
        if(isAppliedBasicAuthentication)
        {
            let loginString = String(format: "%@:%@", strUserName, strPassword)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
            
        }
        
        if(queryStr.count > 0)
        {
            request.httpBody = urlParams.data(using: String.Encoding.utf8)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        else
        {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
                
            } catch let error {
                print(error.localizedDescription)
            }
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        
        callWS(request: request, onSuccess: { (dict) in
            success(dict)
            print(dict);
        }) { (err) in
            print(err?.localizedDescription ?? "");
            failure(err);
        }
        
        
    }
    
    
    //MARK:- DELETE_API_CALL
    func DELETE_API_CALL(str : String,isApplyToken:Bool,isAppliedBasicAuthentication:Bool,dict:NSMutableDictionary,queryStr:String, onSuccess success: @escaping (_ JSON: Any) -> Void, onFailure failure: @escaping (_ error: Error?) -> Void)
    {
        
        let urlParams = queryStr;
        var request = URLRequest(url: URL(string: str)!)
        request.httpMethod = "DELETE"
        
        
        //Authentication
        if(isAppliedBasicAuthentication)
        {
            let loginString = String(format: "%@:%@", strUserName, strPassword)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
            
        }
        
        if(queryStr.count > 0)
        {
            request.httpBody = urlParams.data(using: String.Encoding.utf8)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        else
        {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
                
            } catch let error {
                print(error.localizedDescription)
            }
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        
        callWS(request: request, onSuccess: { (dict) in
            success(dict)
            print(dict);
        }) { (err) in
            print(err?.localizedDescription ?? "");
            failure(err);
        }
        
        
    }
    
    
    //MARK:- UPLOAD_IMAGE_API_CALL
    func UPLOAD_IMAGE_API_CALL(str : String,isApplyToken:Bool,isAppliedBasicAuthentication:Bool,dict:NSMutableDictionary,queryStr:String,image:UIImage, onSuccess success: @escaping (_ JSON: Any) -> Void, onFailure failure: @escaping (_ error: Error?) -> Void)
    {
        
        var request = URLRequest(url: URL(string: str)!)
        request.httpMethod = "POST"
        
        
        let imageData = UIImageJPEGRepresentation(image, 0.6)
        
        
        //Authentication
        if(isAppliedBasicAuthentication)
        {
            let loginString = String(format: "%@:%@", strUserName, strPassword)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
            
        }
        
        //boundry
        let boundaryConstant = "----------------12345";
        let contentType = "multipart/form-data;boundary=" + boundaryConstant
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        // create upload data to send
        let uploadData = NSMutableData()
        
        // add image
        uploadData.append("\r\n--\(boundaryConstant)\r\n".data(using: String.Encoding.utf8)!)
        uploadData.append("Content-Disposition: form-data; name=\"file_name\"; filename=\"file.png\"\r\n".data(using: String.Encoding.utf8)!)
        uploadData.append("Content-Type: image/png\r\n\r\n".data(using: String.Encoding.utf8)!)
        uploadData.append(imageData!)
        uploadData.append("\r\n--\(boundaryConstant)--\r\n".data(using: String.Encoding.utf8)!)
        
        //add parms to request
        if dict.count > 0 {
            for (key, value) in dict {
                uploadData.appendString(string: "--\(boundaryConstant)\r\n")
                uploadData.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                uploadData.appendString(string: "\(value)\r\n")
            }
        }
        
        //set data for upload
        request.httpBody = uploadData as Data
        
        callWS(request: request, onSuccess: { (dict) in
            success(dict)
            print(dict);
        }) { (err) in
            print(err?.localizedDescription ?? "");
            failure(err);
        }
        
        
    }
    
    
    //MARK:- Common Request Method
    func callWS(request : URLRequest,onSuccess success: @escaping (_ JSON: Any) -> Void, onFailure failure: @escaping (_ error: Error?) -> Void)
    {
        
        
        if(Reachability.isConnectedToNetwork())
        {
            
            //session setup
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
                if(response != nil)
                {
                    
                    // Print out reponse body
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    //print("****** response data = \(responseString!)")
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                        
                        print(json ?? "Error")
                        print("responseString :-%@",responseString ?? "error");
                        DispatchQueue.main.async {
                            
                            if((json?.count)! > 0)
                            {
                                //                            let arr = json!["data"] as? NSArray
                                success(json as Any);
                            }
                            
                        }
                        
                    }catch
                    {
                        print(error)
                        failure(error as NSError);
                        
                    }
                }
                else
                {
                    failure(error as NSError?);
                }
                
            })
            
            task.resume()
        }
        else
        {
//            let err = NSError();
//            err.localizedDescription = "Internet is not connected"
//            failure(err);

        }
    }
    
}


extension NSMutableData {
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
    
}


public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
}
