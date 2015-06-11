//
//  ToggleTableViewController.swift
//  E-Share
//
//  Created by Mr.Jim on 6/11/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class ToggleTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "baritem_menu"), style: .Plain, target: self, action: "leftBarButtonItemDidTap")
        
    }
    
    func leftBarButtonItemDidTap() {
        self.drawerContainerViewController?.toggleLeftViewController()
    }

  


}
