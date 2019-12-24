//
//  Announcement.swift
//  INTERNZ
//
//  Created by 최은지 on 25/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

struct Announcement {
    var companyName: String
    var jobName: String
    var day: String
    var companyImage: UIImage?
    
    init(companyName:String, jobName:String, day:String, companyImageName: String){
        self.companyName = companyName
        self.jobName = jobName
        self.day = day
        self.companyImage = UIImage(named: companyImageName)
    }
    
}
