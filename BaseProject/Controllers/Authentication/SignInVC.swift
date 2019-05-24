//
//  SignInVC.swift
//  BaseProject
//
//  Created by VPN on 16/06/18.
//  Copyright © 2018 VPN. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import FacebookCore
//import FacebookCore
//import FacebookLogin
import GoogleSignIn
import SVProgressHUD

class SignInVC: UIViewController,GIDSignInUIDelegate,GIDSignInDelegate {

    
    @IBOutlet var btnForgotPassword: UIButton!
    
    @IBOutlet var vwGmail: GIDSignInButton!
    @IBOutlet weak var btnSignUpClickEvent: UIButton!
    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnGmail: GIDSignInButton!
    let api = ServerAPI()
    let utils = Utils()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = Constant.GOOGLE_CLIENT_ID;
        GIDSignIn.sharedInstance().delegate = self
        
        btnLogin.layer.cornerRadius = 25;
        btnLogin.clipsToBounds = true;
        
        vwGmail.layer.cornerRadius = 25;
        vwGmail.clipsToBounds = true;
        
        btnFacebook.layer.cornerRadius = 25;
        btnFacebook.clipsToBounds = true;
        

//        btnFacebook.titleLabel?.font = UIFon
        

        // Do any additional setup after loading the view.
    }
    
    //FIXME: View Fixes
    func setupview()
    {
        txtLogin.placeholder = "txt_username".localized()
        txtPassword.placeholder = "txt_password".localized()
        btnLogin.titleLabel?.text = "btn_login".localized()
        btnFacebook.titleLabel?.text = "btn_facebook".localized()
        btnSignUpClickEvent.titleLabel?.text = "Dont_have_an_account".localized()
        btnForgotPassword.titleLabel?.text = "btn_forgotpassword".localized()
        
        txtLogin.placeholder = "txt_username".localized();
        txtPassword.placeholder  = "txt_password".localized()
        
//        txtLogin.font = Constant.fon
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Button click events
    
    @IBAction func btnLoginClickEvent(_ sender: Any) {
        
        let dict = NSMutableDictionary()
        dict.setValue(txtLogin.text, forKey: "email");
        dict.setValue(txtPassword.text, forKey: "password");
         
        api.POST_API_CALL(str: Constant.URL_SIGNIN, isApplyToken: true, isAppliedBasicAuthentication: true, dict: dict, queryStr: "", onSuccess: { (json) in
            
            let dictParse = json as? NSDictionary
            let sucess = dictParse?.value(forKey: "success") as? Bool

            if(sucess)!
            {
                let arr = dictParse?.value(forKey: "data") as? NSArray
                print(arr?.count);

            }
            else
            {
                let errMsg = dictParse?.value(forKey: "errpr") as? String;
                self.utils.displayAlert(strMessage: errMsg! as NSString, simple: false, vc: self)
            }
            
          
            
        }) { (err) in
            self.utils.displayAlert(strMessage: (err?.localizedDescription)! as String as NSString, simple: false, vc: self)
        }
    }
    
    @IBAction func btnFacebookClickEvent(_ sender: Any) {

        Constant.appDelObject.isFacebookLogin = true;
        self.getFacebookUserInfo();
    }
    
    @IBAction func btnGmailClickEvent(_ sender: Any) {
    }
    
    
    
    
    @IBAction func btnSignUpClickEvent(_ sender: Any) {
        
        
        let vc = SignUpVC.init(nibName: "SignUpVC", bundle: nil)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btnForgotPasswordClickEvent(_ sender: Any) {
        
        let vc = ForgotPassword.init(nibName: "ForgotPassword", bundle: nil)
    self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //MARK:- Facebook
    func getFacebookUserInfo(){
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email ], viewController: self) { (result) in
            
            switch result{
            case .cancelled:
                print("Cancel button click")
            case .success:
                let params = ["fields" : "id, name, first_name, last_name, picture.type(large), email"]
                let graphRequest = FBSDKGraphRequest.init(graphPath: "/me", parameters: params)
                let Connection = FBSDKGraphRequestConnection()
                Connection.add(graphRequest) { (Connection, result, error) in
                    let info = result as! [String : AnyObject]
                    print(info["name"] as! String)
                    
//                    let modelClass = UserModelClass()
//                    modelClass.user_id = (info["id"] as! String);
//                    modelClass.acess_token = (info["picture"]["data"]["url"] as! String)
//                    modelClass.user_name = (info["name"] as! String)
//                    modelClass.first_name = (info["email"] as! String)
//                    modelClass.email_address = (info["name"] as! String)
//                    if(user.profile.hasImage)
//                    {
//                        let dimension = round(100)
//                        let pic = user.profile.imageURL(withDimension: UInt(dimension))
//                        modelClass.profile_image = (pic?.relativePath)!;
//                    }
                    
                    
                }
                Connection.start()
            default:
                print("??")
            }
        }
        
    }
    
    //MARK:- Google Methods
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    
    
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            
            let modelClass = UserModelClass()
            modelClass.user_id = user.userID;
            modelClass.acess_token = user.authentication.idToken
            modelClass.user_name = user.profile.name
            modelClass.first_name = user.profile.givenName
            modelClass.email_address = user.profile.email
            if(user.profile.hasImage)
            {
                let dimension = round(100)
                let pic = user.profile.imageURL(withDimension: UInt(dimension))
                modelClass.profile_image = (pic?.relativePath)!;
            }
        }
    }
    
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        //myActivityIndicator.stopAnimating()
        
        Constant.appDelObject.isFacebookLogin = false;
        SVProgressHUD.dismiss()
        
    }
    
    // Present a view that prompts the user to sign in with Google
    internal func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.navigationController?.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
