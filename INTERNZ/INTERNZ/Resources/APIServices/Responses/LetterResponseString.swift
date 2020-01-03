//
//  LetterResponseString.swift
//  INTERNZ
//
//  Created by 최은지 on 03/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

struct LetterResponseString: Codable {
    let status: Int
    let success: Bool
    let message: String
    
    let data: [letterDataClass]
}

struct letterDataClass: Codable {
    let userIdx: Int
    let nickname: String
    let frontImage: String
    let content: String

    enum CodingKeys: String, CodingKey {
        case userIdx, nickname
        case frontImage = "front_image"
        case content
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userIdx = (try? values.decode(Int.self, forKey: .userIdx)) ?? 0
        nickname = (try? values.decode(String.self, forKey: .nickname)) ?? ""
        frontImage  = (try? values.decode(String.self, forKey: .frontImage)) ?? ""
        content = (try? values.decode(String.self, forKey: .content)) ?? ""
    }
    
}


