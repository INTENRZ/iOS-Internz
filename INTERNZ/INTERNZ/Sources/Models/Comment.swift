//
//  Comment.swift
//  INTERNZ
//
//  Created by 최은지 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

struct Comment {
    var username: String
    var comment: String
    var commentDate: String
    var profileImg: UIImage?
    
    init(username: String, comment: String, commentDate: String, profileImgName: String){
        self.username = username
        self.comment = comment
        self.commentDate = commentDate
        self.profileImg = UIImage(named: profileImgName)
    }

}

