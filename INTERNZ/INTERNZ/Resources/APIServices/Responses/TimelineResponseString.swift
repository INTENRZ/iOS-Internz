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
    
    let data: [timelineDataClass]?
}

struct timelineDataClass: Codable {
    let timelineIdx: Int
    let userIdx: Int
    let title: String
    let start_date: String
    let end_date: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case timelineIdx, userIdx, title
        case start_date = "start_date"
        case end_date = "end_date"
        case category
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        timelineIdx = (try? values.decode(Int.self, forKey: .timelineIdx)) ?? 0
        userIdx = (try? values.decode(Int.self, forKey: .userIdx)) ?? 0
        title  = (try? values.decode(String.self, forKey: .title)) ?? ""
        start_date = (try? values.decode(String.self, forKey: .start_date)) ?? ""
        end_date = (try? values.decode(String.self, forKey: .end_date)) ?? ""
        category = (try? values.decode(String.self, forKey: .category)) ?? ""
    }
}
