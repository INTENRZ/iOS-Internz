//
//  ProfileBanner.swift
//  INTERNZ
//
//  Created by 최은지 on 28/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit



struct ProfileBanner {
    var profileImg: UIImage?
    
    var userName: String
    var introduce: String
    
    
    init(profileImgName: String, userName: String, introduce: String){
        self.profileImg = UIImage(named: profileImgName)
        self.userName = userName
        self.introduce = introduce
    }
    
}


//import Foundation
//import UIKit
//
//struct Banner {
//    var corpImg: UIImage?
//
//    var corpName: String
//    var jobName: String
//    var day: String
//
//    init(corpImgName: String, corpName: String, jobName: String, day: String){
//        self.corpImg = UIImage(named: corpImgName)
//        self.corpName = corpName
//        self.jobName = jobName
//        self.day = day
//    }
//
//}
