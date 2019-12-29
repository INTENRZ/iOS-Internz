//
//  MessageList.swift
//  INTERNZ
//
//  Created by 박주연 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

struct MessageList {
    
    var send: String
    var time: String
    var content: String
    
    init(send:String, time:String, content:String){
        
        self.send = send
        self.time = time
        self.content = content
        
    }
    
}
