//
//  TimelineStoryResponseString.swift
//  INTERNZ
//
//  Created by 최은지 on 03/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

struct timelineStoryResponseString: Codable {
    let stautus: Int!
    let success: Bool!
    let message: String!
    let data: [timelineStoryDataClass]?
}

struct checkMe: Codable {
    let isMeCheck: String?
}

struct timelineStoryDataClass: Codable {
    let storyIdx, timelineIdx, userIdx: Int?
    let title, content: String?
    let count: Int?
    let created_date, updated_date: String?
    let isme: checkMe?
    
    enum CodingKeys: String, CodingKey {
        case storyIdx, timelineIdx, userIdx, title, content, count
        case created_date = "created_date"
        case updated_date = "updated_date"
        case isme
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        storyIdx = (try? values.decode(Int.self, forKey: .storyIdx)) ?? 0
        timelineIdx = (try? values.decode(Int.self, forKey: .timelineIdx)) ?? 0
        userIdx = (try? values.decode(Int.self, forKey: .userIdx)) ?? 0
        count = (try? values.decode(Int.self, forKey: .count)) ?? 0
        title  = (try? values.decode(String.self, forKey: .title)) ?? ""
        content = (try? values.decode(String.self, forKey: .content)) ?? ""
        created_date = (try? values.decode(String.self, forKey: .created_date)) ?? ""
        updated_date = (try? values.decode(String.self, forKey: .updated_date)) ?? ""
        isme = (try? values.decode(checkMe.self, forKey: .isme)) ?? nil
    }
}
