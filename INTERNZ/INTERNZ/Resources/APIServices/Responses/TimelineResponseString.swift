//
//  TimelineResponseString.swift
//  INTERNZ
//
//  Created by 최은지 on 01/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

struct timelineResponseString: Codable {
    let status: Int
    let success: Bool
    let message: String
    
    let data: [timelineDataClass]
    
    struct timelineDataClass: Codable {
        let timelineIdx: Int
        let userIdx: Int
        let title: String
        let start_date: String
        let end_date: String
        let category: String
    }
    
}

//struct timelineDataClass: Codable {
//    let timelineIdx: Int
//    let userIdx: Int
//    let title: String
//    let start_date: String
//    let end_date: String
//    let category: String
//}

//struct StoryResponseString: Codable{
//    let success: Bool
//    let message: String
//    let data:[StoryDataClass]
//
//struct StoryDataClass: Codable {
//    let title: String
//    let nickname: String
//    let created_date: String
//
//    }
//}
//
