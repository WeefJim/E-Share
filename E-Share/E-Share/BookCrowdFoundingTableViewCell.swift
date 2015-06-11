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
            maxniumCountLabel?.text = "额定人数:" + "\(crowdFoundBook.crowdFoundConfiguration!.maximunCount!)"
            averagePriceLabel?.text = "分摊价格：" + (NSString(format: "%.2f", crowdFoundBook.crowdFoundConfiguration!.averagePrice!) as! String)
        }
    }
    
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookPublisherLabel: UILabel!
    @IBOutlet weak var maxniumCountLabel: UILabel!
    @IBOutlet weak var averagePriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
