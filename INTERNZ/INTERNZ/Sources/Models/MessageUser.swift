//
//  MessageUser.swift
//  INTERNZ
//
//  Created by 박주연 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

struct MessageUser {
    
    var name: String
    var content: String
    var userMessageImg: UIImage?
    
    init(name:String, content:String, userMessageImgName:String){
        
        self.name = name
        self.content = content
        self.userMessageImg = UIImage(named:userMessageImgName)
    }
    
}
