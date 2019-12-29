//
//  MessageListTableViewCell.swift
//  INTERNZ
//
//  Created by 박주연 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class MessageListTableViewCell: UITableViewCell {

    @IBOutlet weak var sendLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
