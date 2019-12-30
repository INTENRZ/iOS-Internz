//
//  UIViewExtensions.swift
//  INTERNZ
//
//  Created by 최은지 on 28/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setViewShadow(){
        self.layer.cornerRadius = 7
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 2
    }
}
