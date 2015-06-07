//
//  BookCrowdFoundTableViewController.swift
//  E-Share
//
//  Created by Mr.Jim on 6/7/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class BookCrowdFoundTableViewController: UITableViewController {
    
    var crowdFoundBooks = [CrowdFoundBook]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "众筹"
        
        // 假数据
        let plistPath = NSBundle.mainBundle().pathForResource("crowdFoundBooks", ofType: ".plist")
        let books = NSArray(contentsOfFile: plistPath!)
        for item in books! {
            let book = CrowdFoundBook()
            book.bookName = item.objectForKey("bookName") as? String
            book.bookAuthor = item.objectForKey("bookAuthor") as? String
            book.bookCover = UIImage(named: item.objectForKey("bookCover") as! String)
            book.bookPublisher = item.objectForKey("bookPublisher") as? String
            book.bookCrowdFounder = item.objectForKey("bookCrowdFounder") as? String
            book.bookPrice = item.objectForKey("bookPrice") as? Float
            crowdFoundBooks.append(book)
        }
        
        
        // table View Configure
        tableView.registerNib(UINib(nibName: "BookCrowdFoundTableViewCell", bundle: nil), forCellReuseIdentifier: "BookCrowdFoundCell")
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
        return crowdFoundBooks.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookCrowdFoundCell") as! BookCrowdFoundTableViewCell
        cell.crowdFoundBook = crowdFoundBooks[indexPath.row]
        return cell
    }

}
