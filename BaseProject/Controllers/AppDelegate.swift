//
//  AppDelegate.swift
//  BaseProject
//
//  Created by VPN on 16/06/18.
//  Copyright © 2018 VPN. All rights reserved.
//

import UIKit
import CoreData
import SideMenuSwift
import FacebookLogin
import FBSDKLoginKit
import FacebookCore
import GoogleSignIn


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   

    var isFacebookLogin : Bool = false;
    var window: UIWindow?
    let context = NSManagedObjectContext();

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        

            setupRootVC()
         //setupRootVCWithSideMenu()
        //setupRootVCWithTab(isEnableSideMenu: true);
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)

     
        return true
    }

    //MARK:- Facebook
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        if(isFacebookLogin)
        {
           return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        }
        else
        {
            return GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: annotation)
        }
    }
 
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    //MARK:- SideMenu
    
    func setupSideMenu()
    {
        SideMenuController.preferences.basic.menuWidth = 240
        SideMenuController.preferences.basic.statusBarBehavior = .hideOnMenu
        SideMenuController.preferences.basic.position = .under
        SideMenuController.preferences.basic.direction = .left
        SideMenuController.preferences.basic.enablePanGesture = true
        SideMenuController.preferences.basic.enablePanGesture = true
    }
    
    
    // MARK: - Core Data stack

    @available(iOS 10.0, *)
    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "BaseProject")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if #available(iOS 10.0, *) {
            let context = persistentContainer.viewContext
        } else {
            // Fallback on earlier versions
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK:- Setup RootVC
    
    func setupRootVCWithSideMenu()
    {
        let homevc = HomeVC.init(nibName: "HomeVC", bundle: nil)
        let menuVC = LeftMenuVC.init(nibName: "LeftMenuVC", bundle: nil)
        let nav = UINavigationController(rootViewController: homevc)
        let sideMenuController = SideMenuController(contentViewController: nav, menuViewController: menuVC)
        self.window?.rootViewController = sideMenuController
        self.window?.makeKeyAndVisible();
    }
    
     func setupRootVC()
     {
        let homevc = SignInVC.init(nibName: "SignInVC", bundle: nil)
        let nav = UINavigationController(rootViewController: homevc)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible();
     }
    
    func setupRootVCWithTab(isEnableSideMenu:Bool)
    {
        let tabController = TabbarVC()

        
        let tab_1 = TabbarVC_1.init(nibName: "TabbarVC_1", bundle: nil)
        let tab_2 = TabbarVC_2.init(nibName: "TabbarVC_2", bundle: nil)
        let tab_3 = TabbarVC_3.init(nibName: "TabbarVC_3", bundle: nil)
        
        
        //setup the tab bar elements with the icons, name and initial view controllers
        let vcData: [(UIViewController, UIImage, String)] = [
            (tab_1, UIImage(named: "icon_home")!, "Home"),
            (tab_2, UIImage(named: "icon_setting")!, "Account"),
            (tab_3, UIImage(named: "icon_account")!, "Setting")

        ]
        
        let vcs = vcData.map { (vc, image, title) -> UINavigationController in
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = image
            nav.title = title
            return nav
        }
        
        tabController.viewControllers = vcs
        tabController.tabBar.barTintColor = UIColor.darkGray
        tabController.tabBar.tintColor = UIColor.white
        tabController.tabBar.isTranslucent = false
        
        if let items = tabController.tabBar.items {
            for item in items {
                if let image = item.image {
                    
                    item.image = image.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                }
            }
        }
        
        
        if isEnableSideMenu {
            
            let menuVC = LeftMenuVC.init(nibName: "LeftMenuVC", bundle: nil)

            let sideMenuController = SideMenuController(contentViewController: tabController, menuViewController: menuVC)
            self.window?.rootViewController = sideMenuController
        }
        else
        {
            window?.rootViewController = tabController

        }
        

        
//        let homevc = HomeVC.init(nibName: "HomeVC", bundle: nil)
//        let nav = UINavigationController(rootViewController: homevc)
        
        

    }
    

}

