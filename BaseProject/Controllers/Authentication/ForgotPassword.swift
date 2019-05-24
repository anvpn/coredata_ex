//
//  ForgotPassword.swift
//  BaseProject
//
//  Created by VPN on 16/06/18.
//  Copyright © 2018 VPN. All rights reserved.
//

import UIKit

class ForgotPassword: UIViewController {

    
    @IBOutlet weak var btnEmailAddress: UITextField!
    @IBOutlet weak var btnChangePassword: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK:- Button Click Events
    @IBAction func btnRecoverAccountClickEvent(_ sender: Any) {
    }
}
