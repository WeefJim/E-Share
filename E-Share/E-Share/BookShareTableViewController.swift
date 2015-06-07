//
//  BookShareTableViewController.swift
//  E-Share
//
//  Created by Mr.Jim on 6/4/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class BookShareTableViewController: UITableViewController {
    
    var shareBooks = [ShareBook]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "分享"
        
        // 假数据
        let plistPath = NSBundle.mainBundle().pathForResource("shareBooks", ofType: ".plist")
        let books = NSArray(contentsOfFile: plistPath!)
        for item in books! {
            let book = ShareBook()
            book.bookName = item.objectForKey("bookName") as? String
            book.bookAuthor = item.objectForKey("bookAuthor") as? String
            book.bookCover = UIImage(named: item.objectForKey("bookCover") as! String)
            book.bookPublisher = item.objectForKey("bookPublisher") as? String
            book.bookSharer = item.objectForKey("bookSharer") as? String
            shareBooks.append(book)
        }
        
        
        // table View Configure
        tableView.registerNib(UINib(nibName: "BookShareTableViewCell", bundle: nil), forCellReuseIdentifier: "BookShareCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return shareBooks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookShareCell") as! BookShareTableViewCell
        cell.shareBook = shareBooks[indexPath.row]
        return cell
    }
    

}
