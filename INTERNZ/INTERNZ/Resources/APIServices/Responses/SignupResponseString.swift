//
//  SignupResponseString.swift
//  INTERNZ
//
//  Created by 박주연 on 01/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

struct SignupResponseString: Codable{
    let success: Bool
    let maessage: String
    let data:[SignupDataClass]
    
    struct SignupDataClass: Codable{
        let email : String
        let password: String
        let phone: String
        let name: String
        let nickname: String
        let age: String
        let sex: String
    }
}
