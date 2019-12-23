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
            , target: self, action: #selector(moveCalendar))
        
        let plusButton = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(plusSchedule))
        
        navigationItem.rightBarButtonItems = [calendarButton, plusButton]
        
        
        
    }
    
    @objc func moveCalendar(){
        print("tap calendar")
        
    }

    @objc func plusSchedule(){
        print("tap plus button")
    }
    
    
}




