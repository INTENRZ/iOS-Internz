//
//  HomeViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // tab bar item 의 title 설정
        if let downcastStrings = self.tabBarController?.tabBar.items
        {
            downcastStrings[0].title = "홈"
            downcastStrings[1].title = "공고"
            downcastStrings[2].title = "스토리"
            downcastStrings[3].title = "프로필"
        }

        
    }
    
}
