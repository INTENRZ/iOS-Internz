//
//  AnnouncementViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class AnnouncementViewController: UIViewController {

    @IBOutlet weak var announcementTable: UITableView!
    
    var announcementList:[Announcement] = [] // 공고 리스트를 전역으로 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뒤로 가기 버튼 숨기기
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        setAnnouncementSampleData()
        
        announcementTable.reloadData()
        
        announcementTable.delegate = self
        announcementTable.dataSource = self
 
    }
 
}

extension AnnouncementViewController {
    func setAnnouncementSampleData(){
        let sample1 = Announcement(companyName: "회사11", jobName: "개발직군", day: "d-20", companyImageName: "1")
        let sample2 = Announcement(companyName: "회사22222", jobName: "개발직군", day: "d-20", companyImageName: "1")
        let sample3 = Announcement(companyName: "회사33", jobName: "개발직군", day: "d-20", companyImageName: "1")
        let sample4 = Announcement(companyName: "회사44", jobName: "디쟌직군", day: "d-20", companyImageName: "1")
        let sample5 = Announcement(companyName: "회사555", jobName: "디쟌직군", day: "d-20", companyImageName: "1")
        
        announcementList = [sample1, sample2, sample3, sample4, sample5]
    }
}


extension AnnouncementViewController: UITableViewDelegate {
    
}

extension AnnouncementViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let announcement = announcementList[indexPath.row]
        
        let cell = announcementTable.dequeueReusableCell(withIdentifier: "AnnouncementCell") as! AnnouncementCell
        
        cell.companyLabel.text = announcement.companyName
        cell.jobLabel.text = announcement.jobName
        cell.dayLabel.text = announcement.day
        cell.companyImageView
            .image = announcement.companyImage
        
        return cell
    }
    
    
}
