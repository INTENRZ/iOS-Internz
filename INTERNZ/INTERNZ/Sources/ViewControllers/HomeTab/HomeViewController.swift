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
        
        // tab bar item image 설정
        self.tabBarController?.tabBar.items![0].image = UIImage(named: "tabHomeActiveIc")
        self.tabBarController?.tabBar.items![1].image = UIImage(named: "tabNoticeIc")
        self.tabBarController?.tabBar.items![2].image = UIImage(named: "tabStoryIc")
        self.tabBarController?.tabBar.items![3].image = UIImage(named: "tabProfileIc")
        
        // tab bar color 설정
        self.tabBarController?.tabBar.selectedImageTintColor = UIColor.marigold

        
    }
    
}
