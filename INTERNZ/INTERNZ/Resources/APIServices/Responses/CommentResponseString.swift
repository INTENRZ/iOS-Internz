//
//  CommentResponseString.swift
//  INTERNZ
//
//  Created by 최은지 on 03/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

import Foundation

// MARK: - Welcome
struct commentResponseString: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [commentDataClass]
}

// MARK: - Datum
struct commentDataClass: Codable {
    let nickname: String
    let frontImage: String
    let content, createdDate: String

    enum CodingKeys: String, CodingKey {
        case nickname
        case frontImage = "front_image"
        case content
        case createdDate = "created_date"
    }
}
