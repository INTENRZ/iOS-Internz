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
    
    @IBOutlet weak var calendarTableView: UITableView!
    
    var dateStructs: [DateStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        // customizing calendar
        calendar.appearance.weekdayTextColor = UIColor.black
        calendar.appearance.eventDefaultColor = UIColor.green
        calendar.appearance.eventSelectionColor = UIColor.green
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        
        let xmas = formatter.date(from: "2019-12-25")
        
        let sampledate = formatter.date(from: "2019-12-22")
        
        dates = [xmas!, sampledate!]
        
        
        // setting calendar table view
        
        setCalendarData()
        
        calendarTableView.delegate = self
        calendarTableView.dataSource = self
        
    }
    
    
    @IBAction func gotoBack(_ sender: Any) {
        
        print("go to back")
        
         let dvc = storyboard?.instantiateViewController(identifier: "Announcement") as! AnnouncementViewController
               
        navigationController?.pushViewController(dvc, animated: true)
               
    }
    
    
    
}

extension CalendarViewController: FSCalendarDataSource{
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {

        if self.dates.contains(date){
            return 1
        }
        
        return 0
    }
}

extension CalendarViewController {
    func setCalendarData(){
        let dateSample1 = DateStruct(companyImgName: "corpImg1", companyName: "회사이름11", jobName: "프론트", date: "d-13")
        let dateSample2 = DateStruct(companyImgName: "corpImg1", companyName: "회사이름22", jobName: "프론트", date: "d-13")
        let dateSample3 = DateStruct(companyImgName: "corpImg1", companyName: "회사이름33", jobName: "프론트", date: "d-13")
        let dateSample4 = DateStruct(companyImgName: "corpImg1", companyName: "회사이름44", jobName: "프론트", date: "d-13")
        
        dateStructs = [dateSample1, dateSample2, dateSample3, dateSample4]
    }
}

extension CalendarViewController: UITableViewDelegate {
    
}

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateStructs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = calendarTableView.dequeueReusableCell(withIdentifier: "dateCell") as! DateTableViewCell
        
        let mydate = dateStructs[indexPath.row]
        
        cell.companyLabel.text = mydate.companyName
        cell.jobLabel.text = mydate.jobName
        cell.dateLabel.text = mydate.date
        cell.companyImage.image = mydate.companyImg
        
        return cell
        
    }
    
    
}
