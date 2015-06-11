//
//  BookCrowdFoundTableViewController.swift
//  E-Share
//
//  Created by Mr.Jim on 6/7/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class BookCrowdFoundTableViewController: ToggleTableViewController {
    
    var crowdFoundBooks = [CrowdFoundBook]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation Item
        self.navigationItem.title = "众筹"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发起", style: UIBarButtonItemStyle.Plain, target: self, action: "rightBarButtonDidTap")
        
        // 假数据
        let plistPath = NSBundle.mainBundle().pathForResource("crowdFoundBooks", ofType: ".plist")
        let books = NSArray(contentsOfFile: plistPath!)
        for item in books! {
            let book = CrowdFoundBook()
            book.bookName = item.objectForKey("bookName") as? String
            book.bookAuthor = item.objectForKey("bookAuthor") as? String
            book.bookCover = UIImage(named: item.objectForKey("bookCover") as! String)
            book.bookPublisher = item.objectForKey("bookPublisher") as? String
            
            let crowdFoundConfiguration = CrowFoundConfiguration()
            crowdFoundConfiguration.bookPrice = item.objectForKey("bookPrice") as? Float
            crowdFoundConfiguration.maximunCount = item.objectForKey("maximunCount") as? Int
            crowdFoundConfiguration.crowdFoundId = item.objectForKey("crowdFoundId") as? String
            crowdFoundConfiguration.bookCrowdFounder = item.objectForKey("bookCrowdFounder") as? String
            
            book.crowdFoundConfiguration = crowdFoundConfiguration
            
            crowdFoundBooks.append(book)
        }
        
        
        // table View Configure
        tableView.registerNib(UINib(nibName: "BookCrowdFoundTableViewCell", bundle: nil), forCellReuseIdentifier: "BookCrowdFoundCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crowdFoundBooks.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookCrowdFoundCell") as! BookCrowdFoundTableViewCell
        cell.crowdFoundBook = crowdFoundBooks[indexPath.row]
        return cell
    }
    
    
    func rightBarButtonDidTap(){
        
    }
    

}
