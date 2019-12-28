//
//  FollowTableViewCell.swift
//  INTERNZ
//
//  Created by 박주연 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class FollowTableViewCell: UITableViewCell {
    
    @IBOutlet weak var followImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var followcontentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        followButton.setCornerRadius()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}



