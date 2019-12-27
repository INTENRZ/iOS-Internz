//
//  TimelineStory.swift
//  INTERNZ
//
//  Created by 박주연 on 27/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

struct TimelinesStory{
    
    var storyImg: UIImage?
    var storyTitle: String
    var name: String
    var date: String
    
    init(title:String, name:String, date:String, storyImgName:String){
        self.storyImg = UIImage(named: storyImgName)
        self.storyTitle = title
        self.name = name
        self.date = date
    }
    
}
