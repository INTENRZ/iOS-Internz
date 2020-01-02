//
//  StoryDetailResponseString.swift
//  INTERNZ
//
//  Created by 최은지 on 03/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

struct storyDetailResponseString: Codable {
    let status: Int
    let success: Bool
    let message: String
    
    let data: [storyDetailDataClass]?
}

struct storyDetailDataClass: Codable {
    let title: String
    let content: String
    let created_date: String
    let nickname: String
    let front_image: String
    let introduce: String
    let comment_count: Int
    let userIdx: Int
    let isme: Int
}
