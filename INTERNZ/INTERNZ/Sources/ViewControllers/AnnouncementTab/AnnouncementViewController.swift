//
//  AnnouncementViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import Kingfisher

class AnnouncementViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    var dataArray = ["최신순", "마감순"] // picker view array
    
    @IBOutlet weak var announcementTable: UITableView!
    
    @IBOutlet weak var sortButton: UIButton!
    
    @IBOutlet weak var filtterButton: UIButton!
    
    var announcementList:[Announcement] = [] // 공고 리스트를 전역으로 선언
    
    var jobDataSet = [jobResponseString.JobDataClass]()
    
    var picker = UIView()
    var sortPicker = UIPickerView()
    
    var isClickedSortBtn: Bool = false
    var selectString = "최신순" // pickerView 에서 선택한 내용
    
    private var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뒤로 가기 버튼 숨기기
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        announcementTable.reloadData()
        
        announcementTable.delegate = self
        announcementTable.dataSource = self
        
        self.sortButton.titleLabel?.text = selectString
        
        downloadJobData()
        
        self.announcementTable.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
    }
    
    @objc func refresh(){
//        downloadJobData()
        
        if self.sortButton.titleLabel?.text == "최신순" {
            downloadJobData()
        } else {
            downloadJobPastData()
        }
        
        self.refreshControl.endRefreshing()
    }
    
    @IBAction func goFilterView(_ sender: UIButton) {
        
        let dvc = storyboard?.instantiateViewController(identifier: "SortSelectViewController") as! SortSelectViewController
        
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func gotoCalendar(_ sender: UIBarButtonItem) {
        
        print("go to calendar")
        
        let dvc = storyboard?.instantiateViewController(identifier: "CalendarViewController") as! CalendarViewController
        
        navigationController?.pushViewController(dvc, animated: true)
        
    }
    
    
    // 정렬 버튼 눌렀을 때 -> picker 생성
    // create UIPickerViews programmatically
    @IBAction func clickSortBtn(_ sender: Any) {
        
        print("sort")
        
        // 1. 전체를 잡는 view 생성 + constraint 걸기
        self.picker.isHidden = false
        self.picker.frame = CGRect(x: 0, y: view.frame.height - 220, width: view.frame.width, height: 150)
        
        view.addSubview(self.picker)
        
        // 2. Tool Bar 에 들어갈 버튼 생성
        let btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.testfunc))
        
        // 3. UIPicker Toolbar 생성 + 속성 setting
        let barAccessory = UIToolbar(frame: CGRect(x: 0, y: 0, width: picker.frame.width, height: 44))
        
        barAccessory.barStyle = UIBarStyle.default
        barAccessory.isTranslucent = true
        barAccessory.items = [btnDone]
        
        picker.addSubview(barAccessory)
        
        // 4. PickerView 생성
        self.sortPicker.frame = CGRect(x: 0, y: barAccessory.frame.height, width: view.frame.width, height: picker.frame.height - barAccessory.frame.height)
        self.sortPicker.delegate = self
        self.sortPicker.dataSource = self
        self.sortPicker.backgroundColor = UIColor.whiteFour
        
        picker.addSubview(sortPicker)
    }
    
    // 최신순 공고 조회
    func downloadJobData(){
        JobListService.sharedJob.getJobList {
            
            response in
            switch response {
            case .success(let data):
                self.jobDataSet = []
                self.jobDataSet = data
                self.announcementTable.reloadData()
                
            case .failure :
                print("error")
            }
        }
    }
    
    // 지난 공고 조회
    func downloadJobPastData(){
        JobListService.sharedJob.getPastJobList {
            
            response in
            switch response {
            case .success(let data):
                self.jobDataSet = []
                self.jobDataSet = data
                self.announcementTable.reloadData()
                
            case .failure :
                print("error")
            }
        }
    }
    
    
    // UIPickerView delegate functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let row = dataArray[row]
//        return row
        self.selectString = dataArray[row]
        return selectString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        selectString = dataArray[pickerView.selectedRow(inComponent: row)]
//        self.selectString = dataArray[row]
        self.selectString = dataArray[row]
    }
    
    // PickerView 완료 버튼 클릭
    @objc func testfunc(){
        
        if isClickedSortBtn == false{
            self.picker.isHidden = true
            isClickedSortBtn = false
        } else {
            self.picker.isHidden = false
            isClickedSortBtn  = true
        }
        
        if selectString == "최신순"{
            print("최신순조회")
            self.sortButton.setTitle("최신순", for: .normal)
            downloadJobData();
        } else {
            print("마감순조회")
            self.sortButton.setTitle("마감순", for: .normal)
            downloadJobPastData()
        }
    
    } // testfunc()
}

extension AnnouncementViewController {
}

extension AnnouncementViewController: UITableViewDelegate {
    
}

extension AnnouncementViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobDataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = announcementTable.dequeueReusableCell(withIdentifier: "AnnouncementCell") as! AnnouncementCell
        
        
        cell.companyLabel.text = "\(jobDataSet[indexPath.row].company)"
        cell.jobLabel.text = "\(jobDataSet[indexPath.row].team)"
        cell.dayLabel.text = " D "+"\(jobDataSet[indexPath.row].d_day)"
        
        let urlStr = jobDataSet[indexPath.row].logo
        let url = URL(string: urlStr)
        
        cell.companyImageView.kf.setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .normal, title: "추가") { action, index in
            //하고싶은 작업
            
            let alert = UIAlertController(title: "일정 추가!", message: "내 일정 리스트에서 확인해 주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
        }
        share.backgroundColor = UIColor.marigold
        
        return [share]
    }
}
