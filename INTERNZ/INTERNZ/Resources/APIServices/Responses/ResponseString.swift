//
//  ResponseString.swift
//  INTERNZ
//
//  Created by 최은지 on 30/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation

// 로그인 성공 시 response body

struct loginResponseString: Codable {
    let success: Bool
    let message: String
    let data: LoginDataClass?
}

struct LoginDataClass: Codable {
    let token: String
    let refreshToken: String
    let isFirst: String
}

