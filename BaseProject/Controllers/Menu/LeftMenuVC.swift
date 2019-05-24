//
//  LeftMenuVC.swift
//  BaseProject
//
//  Created by VPN on 16/06/18.
//  Copyright © 2018 VPN. All rights reserved.
//

import UIKit

class LeftMenuVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tblMenu: UITableView!
    @IBOutlet var tblHeaderView: UIView!
    @IBOutlet weak var btnProfilePic: UIButton!
    @IBOutlet weak var lblUserName: UILabel!
    let arrMenu = NSMutableArray()
    
    
    //MARK:- Class methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrMenu.add("Home")
        arrMenu.add("Profile")
        arrMenu.add("Setting")
        arrMenu.add("Logout")

        // Do any additional setup after loading the view.
        self.setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- TableView Functions
    
    func setupTableView() {
        tblMenu.delegate = self;
        tblMenu.dataSource  = self;
        self.tblMenu.register(UINib(nibName: "cell_leftMenu", bundle: nil), forCellReuseIdentifier: "cell")
        self.tblMenu.tableHeaderView = UIView();
//        self.automaticallyAdjustsScrollViewInsets = false
 
    }
    
    
    //MARK:- Tableview delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? cell_leftMenu
        
        cell?.lbl_value.text = arrMenu.object(at: indexPath.row) as? String
        
        return cell!;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

    // MARK: - Button Events
    @IBAction func btnChangeProfilePic(_ sender: Any) {
    }
    


}
