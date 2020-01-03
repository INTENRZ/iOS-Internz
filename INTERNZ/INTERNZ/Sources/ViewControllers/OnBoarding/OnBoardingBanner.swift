//
//  onBoardingBanner.swift
//  INTERNZ
//
//  Created by 최은지 on 03/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation
import UIKit

struct BoardingBanner {
    var bannerImg: UIImage?
    
    init(bannerImg: String){
        self.bannerImg = UIImage(named: bannerImg)
    }
}

