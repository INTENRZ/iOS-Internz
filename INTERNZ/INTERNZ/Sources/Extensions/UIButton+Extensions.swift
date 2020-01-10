//
//  UIButtonExtensions.swift
//  INTERNZ
//
//  Created by 최은지 on 28/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func setFavor() {

        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.borderColor = UIColor.whiteFour.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        self.tintColor = UIColor.darkGreyTwo
    
    }
    
    func selectFavor(){
        self.layer.borderColor = UIColor.marigold.cgColor
    }
    
    func disSelectFavor(){
        self.layer.borderColor = UIColor.whiteFour.cgColor
    }
    
    func setBorderGray() {
        self.layer.borderColor = UIColor.whiteFour.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
    }
    
    func setCategoryGray() {
        self.layer.borderColor = UIColor.whiteFour.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
    }
    
    func underline() {
        guard let title = self.titleLabel else { return }
        guard let tittleText = title.text else { return }
        let attributedString = NSMutableAttributedString(string: (tittleText))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: (tittleText.count)))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

