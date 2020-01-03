//
//  AnnouncementCell.swift
//  INTERNZ
//
//  Created by 최은지 on 25/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class AnnouncementCell: UITableViewCell {
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var companyImageView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.jobLabel.setMultiLine()
    }
}
