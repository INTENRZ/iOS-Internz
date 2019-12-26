//
//  CalendarViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let date = Date()
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        
        let xmas = formatter.date(from: "2019-12-25")
        
        calendar.select(xmas)
        
        
//        calendar.select(Date)
        
        
          
        
    }
    
    
}




