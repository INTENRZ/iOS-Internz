//
//  ProfileTableViewCell.swift
//  INTERNZ
//
//  Created by 박주연 on 28/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

//extension UIView{
//
//func setCornerRadius(){
//    self.layer.cornerRadius = 10
//    self.clipsToBounds = true
//}
//}

class ProfileTableViewCell: UITableViewCell {



    @IBOutlet weak var timelineImgView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var clickImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
      categoryLabel.setCornerRadius()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
