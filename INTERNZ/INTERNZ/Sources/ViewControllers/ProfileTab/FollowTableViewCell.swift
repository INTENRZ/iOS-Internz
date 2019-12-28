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
    
    var btn : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        followButton.setCornerRadius()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // 버튼을 누르면 색과 안의 텍스트가 바뀐다.
    @IBAction func startFollow(_ sender: UIButton) {
        
        if btn == false{
            
            sender.layer.backgroundColor = UIColor.marigold.cgColor
            followButton.setTitle("팔로우", for: .normal)
            btn = true
        }
            
        else{
            
            sender.layer.backgroundColor = UIColor.whiteFour.cgColor
            followButton.setTitle("팔로잉", for: .normal)
            btn = false
        }
        
        
    }
    
    
    
}



