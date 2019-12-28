//
//  AnnouncementViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class AnnouncementViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    var dataArray = ["최신순", "마감순"] // picker view array
    
    @IBOutlet weak var announcementTable: UITableView!
    
    @IBOutlet weak var sortButton: UIButton!
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        backItem.tintColor = UIColor.black
        navigationItem.backBarButtonItem = backItem
    }
    
    
    // 정렬 버튼 눌렀을 때 - picker 생성
    // create UIPickerViews programmatically
    @IBAction func clickSortBtn(_ sender: Any) {
        
        print("sort")
        
        // 1. 전체를 잡는 view 생성 + constraint 걸기
        let picker = UIView(frame: CGRect(x: 0, y: view.frame.height - 260, width: view.frame.width, height: 260))
        
        view.addSubview(picker)
        
        
        // 2. Tool Bar 에 들어갈 버튼 생성
        let btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.testfunc))
        
        
        // 3. UIPicker Toolbar 생성 + 속성 setting
        let barAccessory = UIToolbar(frame: CGRect(x: 0, y: 0, width: picker.frame.width, height: 44))
        
        barAccessory.barStyle = UIBarStyle.default
        barAccessory.isTranslucent = true
        barAccessory.items = [btnDone]
        
        picker.addSubview(barAccessory)

        
        // 4. PickerView 생성
        let sortPicker = UIPickerView(frame: CGRect(x: 0, y: barAccessory.frame.height, width: view.frame.width, height: picker.frame.height - barAccessory.frame.height))
        sortPicker.delegate = self
        sortPicker.dataSource = self
        sortPicker.backgroundColor = UIColor.whiteFour
        
        picker.addSubview(sortPicker)
        
    
    }
    
    
    // UIPickerView delegate functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = dataArray[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectString = dataArray[pickerView.selectedRow(inComponent: 0)]
        print(selectString)
        
        sortButton.titleLabel?.text = selectString
    }
    
    @objc func testfunc(){
        print("test")
    }
    
}

extension AnnouncementViewController {
    func setAnnouncementSampleData(){
        let sample1 = Announcement(companyName: "회사11", jobName: "개발직군", day: "d-20", companyImageName: "1")
        let sample2 = Announcement(companyName: "회사22222", jobName: "개발직군", day: "d-20", companyImageName: "1")
        let sample3 = Announcement(companyName: "회사33", jobName: "개발직군", day: "d-20", companyImageName: "1")
        let sample4 = Announcement(companyName: "회사44", jobName: "디쟌직군", day: "d-20", companyImageName: "1")
        let sample5 = Announcement(companyName: "회사555", jobName: "디쟌직군", day: "d-20", companyImageName: "1")
        
        announcementList = [sample1, sample2, sample3, sample4, sample5, sample1, sample1, sample1, sample1]
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
        cell.companyImageView.image = announcement.companyImage
        
        return cell
    }
    
    
}
