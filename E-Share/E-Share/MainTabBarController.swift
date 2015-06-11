//
//  MainTabBarController.swift
//  E-Share
//
//  Created by Mr.Jim on 6/4/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 开启状态栏
        UIApplication.sharedApplication().statusBarHidden = false
        
        // 分享平台列表
        let bookShareController = UINavigationController(rootViewController: BookShareTableViewController())
        bookShareController.navigationBar.barTintColor = UIColor.themeBlueColor()
        bookShareController.navigationBar.tintColor = UIColor.whiteColor()
        bookShareController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        bookShareController.tabBarItem = UITabBarItem(title: "分享", image: UIImage(named: "tab_share")!, selectedImage: UIImage(named: "tab_share")!)

        
        
        //众筹平台列表
        let bookCrowdFoundController = UINavigationController(rootViewController: BookCrowdFoundTableViewController())
        bookCrowdFoundController.navigationBar.barTintColor = UIColor.themeBlueColor()
        bookCrowdFoundController.navigationBar.tintColor = UIColor.whiteColor()
        bookCrowdFoundController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        bookCrowdFoundController.tabBarItem = UITabBarItem(title: "众筹", image: UIImage(named: "tab_crowdfound")!, selectedImage: UIImage(named: "tab_crowdfound")!)

        
        
        self.viewControllers = [bookShareController , bookCrowdFoundController]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
