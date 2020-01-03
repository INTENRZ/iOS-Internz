//
//  TimelineStoryResponseString.swift
//  INTERNZ
//
//  Created by 최은지 on 03/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

struct timelineStoryResponseString: Codable {
    let status: Int
    let success: Bool
    let message: String
    
    let data: [timelineStoryDataClass]?
}


struct timelineStoryDataClass: Codable {
    let storyIdx, timelineIdx, userIdx: Int
    let title, content: String
    let count: Int
    let createdDate, updatedDate, isme: String

    enum CodingKeys: String, CodingKey {
        case storyIdx, timelineIdx, userIdx, title, content, count
        case createdDate = "created_date"
        case updatedDate = "updated_date"
        case isme
    }
}
