//
//  FollowResponseString.swift
//  INTERNZ
//
//  Created by 최은지 on 03/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation


struct followResponseString: Codable {
    let status: Int
    let success: Bool
    let message: String
    
    let data: [followDataClass]
}

struct followDataClass: Codable {
    let frontImage: String
    let nickname, introduce: String
    
    enum CodingKeys: String, CodingKey {
        case frontImage = "front_image"
        case nickname, introduce
    }
}

struct ResponseData<T: Codable>: Codable {
    var status: Int
    var message: String
    var data: T
}
