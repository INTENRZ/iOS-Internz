//
//  UILabel+Extensions.swift
//  INTERNZ
//
//  Created by 최은지 on 03/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func setMultiLine(){
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 0
    }
    
}
