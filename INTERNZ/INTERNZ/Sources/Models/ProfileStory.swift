//
//  ProfileStory.swift
//  INTERNZ
//
//  Created by 박주연 on 28/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

struct ProfileStory{
    
    var profilestoryTitle: String
    var category: String
    var date: String
    
    init(title:String, name:String, date:String){
       
        self.profilestoryTitle = title
        self.category = name
        self.date = date
    }
    
}
