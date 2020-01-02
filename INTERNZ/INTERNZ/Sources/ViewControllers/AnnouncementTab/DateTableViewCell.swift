//
//  DateTableViewCell.swift
//  INTERNZ
//
//  Created by 최은지 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wholeView: UIView!
    @IBOutlet weak var colorDotView: UIView!
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var companyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        wholeView.setViewShadow()
        colorDotView.layer.cornerRadius = 45
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
