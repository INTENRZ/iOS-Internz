//
//  SignupResponseString.swift
//  INTERNZ
//
//  Created by 박주연 on 01/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

struct SignupResponseString: Codable{
    let status : Int
    let success: Bool
    let message : String
}
