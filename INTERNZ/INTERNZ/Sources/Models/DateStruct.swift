//
//  Date.swift
//  INTERNZ
//
//  Created by 최은지 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

struct DateStruct {
    var companyImg: UIImage?
    var companyName: String
    var jobName: String
    var date: String
    
    init(companyImgName: String, companyName: String, jobName: String, date: String) {
        self.companyImg = UIImage(named: companyImgName)
        self.companyName = companyName
        self.jobName = jobName
        self.date = date
    }
    
}
