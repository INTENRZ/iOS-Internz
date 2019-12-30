//
//  jobResponseString.swift
//  INTERNZ
//
//  Created by 최은지 on 30/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation

struct jobResponseString: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data : [JobDataClass]
    
    struct JobDataClass: Codable {
        let jobIdx: Int
        let company: String
        let task1: String
        let task2: String
        let task3: String
        let start_date: String
        let end_date: String
        let d_day: Int
        let url: String
        let ispast: Int
        let team: String
    }

}
