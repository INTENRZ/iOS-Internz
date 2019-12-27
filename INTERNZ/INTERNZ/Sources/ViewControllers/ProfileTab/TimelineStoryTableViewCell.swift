//
//  TimelineStoryTableViewCell.swift
//  INTERNZ
//
//  Created by 박주연 on 27/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class TimelineStoryTableViewCell: UITableViewCell {

    @IBOutlet weak var storyTitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var storyImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        storyTitleLabel.lineBreakMode = .byWordWrapping
        storyTitleLabel.numberOfLines = 0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
