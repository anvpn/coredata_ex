//
//  ChangePasswordVC.swift
//  BaseProject
//
//  Created by VPN on 16/06/18.
//  Copyright © 2018 VPN. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController {

    
    @IBOutlet weak var txtCurrentPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtCPassword: UITextField!
    
    @IBOutlet weak var btnChangePassword: UIButton!
    
    
    //MARK:- Class methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK:- Button click events
    
    @IBOutlet weak var btnChangePasswordClickEvents: UIButton!
    

}
