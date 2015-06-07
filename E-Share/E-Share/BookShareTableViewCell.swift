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
            bookSharerLabel?.text = "分享者：" + shareBook.bookSharer!
            
        }
    }
    
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookPublisherLabel: UILabel!
    @IBOutlet weak var bookSharerLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
