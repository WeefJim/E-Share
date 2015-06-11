//
//  BookShareTableViewController.swift
//  E-Share
//
//  Created by Mr.Jim on 6/4/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class BookShareTableViewController: ToggleTableViewController {
    
    var shareBooks = [ShareBook]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // navigation Item
        self.navigationItem.title = "分享"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: "rightBarButtonDidTap")
        
        // 假数据
        let plistPath = NSBundle.mainBundle().pathForResource("shareBooks", ofType: ".plist")
        let books = NSArray(contentsOfFile: plistPath!)
        for item in books! {
            let book = ShareBook()
            book.bookName = item.objectForKey("bookName") as? String
            book.bookAuthor = item.objectForKey("bookAuthor") as? String
            book.bookCover = UIImage(named: item.objectForKey("bookCover") as! String)
            book.bookPublisher = item.objectForKey("bookPublisher") as? String
            
            let shareConfiguration = ShareConfiguration()
            shareConfiguration.shareId = item.objectForKey("shareId") as? String
            shareConfiguration.sharer = item.objectForKey("sharer") as? String
            shareConfiguration.shareDate = item.objectForKey("shareDate") as? NSDate
            shareConfiguration.shareCount = item.objectForKey("shareCount") as? Int
            shareConfiguration.downLoadCount = item.objectForKey("downLoadCount") as? Int
            
            book.shareConfiguration = shareConfiguration
            
            shareBooks.append(book)
        }
        
        
        // table View Configure
        tableView.registerNib(UINib(nibName: "BookShareTableViewCell", bundle: nil), forCellReuseIdentifier: "BookShareCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return shareBooks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookShareCell") as! BookShareTableViewCell
        cell.shareBook = shareBooks[indexPath.row]
        return cell
    }
    
    
    func rightBarButtonDidTap(){
        
    }
    

}
