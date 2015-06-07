//
//  BookCrowdFoundingTableViewCell.swift
//  E-Share
//
//  Created by Mr.Jim on 6/4/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class BookCrowdFoundTableViewCell: UITableViewCell {
    
    
    var crowdFoundBook: CrowdFoundBook! {
        didSet{
            coverImageView?.image = crowdFoundBook.bookCover
            bookNameLabel?.text = crowdFoundBook.bookName!
            bookAuthorLabel?.text = "作者：" + crowdFoundBook.bookAuthor!
            bookPublisherLabel?.text = "出版社:" + crowdFoundBook.bookPublisher!
            bookCrowdFoundStarterLabel?.text = "众筹发起者:" + crowdFoundBook.bookCrowdFounder!
            bookPriceLabel?.text = "价格：" + "\(crowdFoundBook.bookPrice)"

        }
    }
    
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookPublisherLabel: UILabel!
    @IBOutlet weak var bookCrowdFoundStarterLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
