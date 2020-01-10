//
//  EmailCheckResponseString.swift
//  INTERNZ
//
//  Created by 최은지 on 10/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

struct EmailCheckResponseString: Codable{
    let status : Int
    let success: Bool
    let message : String
}
