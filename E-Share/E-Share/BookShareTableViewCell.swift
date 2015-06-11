//
//  BookShareTableViewCell.swift
//  E-Share
//
//  Created by Mr.Jim on 6/4/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class BookShareTableViewCell: UITableViewCell {
    
    
    var shareBook: ShareBook! {
        didSet{
            coverImageView?.image = shareBook.bookCover!
            bookNameLabel?.text = shareBook.bookName!
            bookAuthorLabel?.text = "作者：" + shareBook.bookAuthor!
            bookPublisherLabel?.text = "出版社：" + shareBook.bookPublisher!
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy mm-dd"
            let dateString = dateFormatter.stringFromDate(shareBook.shareConfiguration!.shareDate!)
            shareDateLabel?.text = "分享日期：" + dateString
            
            downLoadCountLabel?.text = "下载次数：" + "\(shareBook.shareConfiguration!.downLoadCount!)"
        }
    }
    
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookPublisherLabel: UILabel!
    @IBOutlet weak var shareDateLabel: UILabel!
    @IBOutlet weak var downLoadCountLabel: UILabel!

    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
