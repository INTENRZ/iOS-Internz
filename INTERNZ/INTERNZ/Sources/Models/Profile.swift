//
//  Profile.swift
//  INTERNZ
//
//  Created by 최은지 on 28/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

struct Profile {
    var username: String
    var introduce: String
    var profileImg: UIImage?
    
    init(username:String, introduce:String, profileImgName: String){
        self.username = username
        self.introduce = introduce
        self.profileImg = UIImage(named: profileImgName)
    }
}
