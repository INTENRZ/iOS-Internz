//
//  CalendarViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        let calendarImage = UIImage(named: "searchIcon")!
        let plusImage = UIImage(named: "searchIcon")!
        
        let calendarButton = UIBarButtonItem(image: calendarImage, style: .plain
            , target: self, action: #selector(moveAnnouncement))
        
        let plusButton = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(plusSchedule))
        
        navigationItem.rightBarButtonItems = [plusButton, calendarButton]
        
        
        
    }
    
    
    // 공고 리스트 view 로 이동
    @objc func moveAnnouncement(){
        print("tap back to list")
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "Announcement") as? AnnouncementViewController {
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }

    // 캘린더 뷰에 일정 추가 
    @objc func plusSchedule(){
        print("tap plus button")
    }
    
    
}




