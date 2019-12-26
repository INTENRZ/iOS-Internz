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
    
    var dates: [Date] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // customizing calendar
        calendar.appearance.weekdayTextColor = UIColor.black
        calendar.appearance.eventDefaultColor = UIColor.green
        calendar.appearance.eventSelectionColor = UIColor.green
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        
        let xmas = formatter.date(from: "2019-12-25")
        
        let sampledate = formatter.date(from: "2019-12-22")
        
//        calendar.select(xmas)
//        calendar.select(sampledate)
        
        dates = [xmas!, sampledate!]
        
        
        
    }
}

extension CalendarViewController: FSCalendarDataSource{
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        
//        let formatter2 = DateFormatter()
//        formatter2.locale = Locale(identifier: "ko_KR")
//        formatter2.dateFormat = "yyyy-MM-dd"
//
//        let dateString = formatter2.string(from: date)
        
        if self.dates.contains(date){
            return 1
        }
        
        
        
        
        return 0
    }
}
