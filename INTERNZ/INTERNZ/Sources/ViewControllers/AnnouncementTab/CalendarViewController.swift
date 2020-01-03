//
//  CalendarViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import FSCalendar
import Kingfisher


class CalendarViewController: UIViewController {
    
    @IBOutlet weak var calendar: FSCalendar!
    
    var dates: [Date] = []
    
    @IBOutlet weak var calendarTableView: UITableView!
    
    var dateStructs: [DateStruct] = []
    
    var calenderDataSet = [calenderResponseString.calenderListDataClass]()
    
    private var refreshControl = UIRefreshControl()
    
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
        
        calendarTableView.delegate = self
        calendarTableView.dataSource = self
        
        downloadCalenderData()
        
        self.calendarTableView.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
    }
    
    @objc func refresh(){
        downloadCalenderData()
    
        self.refreshControl.endRefreshing()
    }
    
    
    func downloadCalenderData(){
        
        CalenderService.calenderShared.calenderList {
            
            response in
            
            switch response {
            case .success(let data):
                print("success ㅠㅠㅠㅠㅠ")
                print(data)
                
                self.calenderDataSet = data as! [calenderResponseString.calenderListDataClass]
                
                self.calendarTableView.reloadData()
                
            case .networkFail :
                print(".networkFail")
                
            case .pathErr :
                print(".pathErr")
                
            case .requestErr(_):
                print(".requestErr")
            case .serverErr:
                print(".serverErr")
                
            }
        }
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

extension CalendarViewController: UITableViewDelegate {
    
}

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calenderDataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = calendarTableView.dequeueReusableCell(withIdentifier: "dateCell") as! DateTableViewCell
        
        let schedule = calenderDataSet[indexPath.row]
        
        cell.companyLabel.text = schedule.company
        cell.jobLabel.text = schedule.team
        
        var leftDay = "d" + String(schedule.d_day) as! String
        cell.dateLabel.text = leftDay
        
        var urlStr = schedule.logo
        let url = URL(string: urlStr)
        cell.companyImage.kf.setImage(with: url)
        
        return cell
    }
}
