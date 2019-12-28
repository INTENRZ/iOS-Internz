//
//  Follow.swift
//  INTERNZ
//
//  Created by 박주연 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

struct Follow{
    
    var name: String
    var introduce: String
    var followImg: UIImage?
    
    init(name:String, introduce:String, followImgName:String){
        
        self.name = name
        self.introduce = introduce
        self.followImg = UIImage(named:followImgName)
    }

}
