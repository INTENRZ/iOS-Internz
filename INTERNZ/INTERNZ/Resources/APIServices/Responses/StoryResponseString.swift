//
//  StoryResponseString.swift
//  INTERNZ
//
//  Created by 박주연 on 31/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation

struct StoryResponseString: Codable{
    let success: Bool
    let message: String
    let data:[StoryDataClass]
    
struct StoryDataClass: Codable {
    let title: String
    let nickname: String
    let created_date: String

    }
}
