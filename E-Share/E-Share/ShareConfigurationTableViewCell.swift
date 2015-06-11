//
//  ShareConfigurationTableViewCell.swift
//  E-Share
//
//  Created by Mr.Jim on 6/8/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class ShareConfigurationTableViewCell: UITableViewCell {

    var shareBook: ShareBook?
    
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookSharerLabel: UILabel!
    @IBOutlet weak var shareDateLabel: UILabel!
    @IBOutlet weak var shareCountLabel: UILabel!
    @IBOutlet weak var downLabelCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
