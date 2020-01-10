//
//  StoryViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var sortButton: UIButton!
    var picker = UIView()
    var pickerView = UIPickerView()
    
    var dataArray = ["최신순", "조회순"] // picker view array
    
    var isClickedSortBtn:Bool = false
    var selectedRow : Int = 0
    var selectedLabel : String = ""
    
    @IBOutlet weak var storyTable: UITableView!
    
    var category: String?
    
    var StoryList: [Story] = []
    var StoryDataSet = [StoryResponseString.StoryDataClass]()
    
    private var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTable.dataSource = self
        storyTable.delegate = self
        
        downloadStoryData()
        
        self.storyTable.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc func refresh(){
        if self.selectedLabel == "최신순" {
            downloadStoryData()
        } else {
            downloadStoryCountData()
        }
        
        self.refreshControl.endRefreshing()
    }
    
    
    // picker view 생성
    @IBAction func doSortStory(_ sender: UIButton) {
        
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
        
        
        self.pickerView.frame = CGRect(x: 0, y: barAccessory.frame.height, width: view.frame.width, height: picker.frame.height - barAccessory.frame.height)
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.pickerView.backgroundColor = UIColor.whiteFour
        
        picker.addSubview(self.pickerView)
    }
    
    
    // 스토리 최신순 조회
    func downloadStoryData(){
        
        StoryListService.shared.StoryList {
            
            response in
            
            switch response{
            case .success(let data):
                self.StoryDataSet = [] // 초기화
                self.StoryDataSet = data as! [StoryResponseString.StoryDataClass]
                self.storyTable.reloadData()
            case.networkFail:
                print("error")
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            }
        }
    }
    
    
    // 스토리 조회순 조회
    func downloadStoryCountData(){
        
        StoryListService.shared.StoryCountList {
            
            response in
            
            switch response{
            case .success(let data):
                self.StoryDataSet = [] // 초기화
                self.StoryDataSet = data as! [StoryResponseString.StoryDataClass]
                self.storyTable.reloadData()
            case.networkFail:
                print("error")
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            }
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.selectedLabel = dataArray[row]
        return selectedLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.selectedRow = row
        self.selectedLabel = dataArray[selectedRow]
    }
    
    // PickerView 완료 버튼 클릭
    @objc func testfunc(){
        sortButton.titleLabel?.text = selectedLabel
        
        if isClickedSortBtn == false {
            self.picker.isHidden = true
            isClickedSortBtn = false
        } else {
            self.picker.isHidden = false
            isClickedSortBtn = true
        }
        
        print(selectedLabel)
        
        if selectedLabel == "최신순" {
            print("최신순 조회")
            self.sortButton.setTitle("최신순", for: .normal)
            downloadStoryData()
        }
        else {
            print("조회순 조회")
            self.sortButton.setTitle("조회순", for: .normal)
            downloadStoryCountData()
        }
        
    }
}

extension StoryViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let story = StoryDataSet[indexPath.row]
        
        let dvc = storyboard?.instantiateViewController(identifier: "StoryDetailViewController") as! StoryDetailViewController
        
        
        dvc.storyIdx = story.storyIdx
        dvc.storyIdx = story.storyIdx
        
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: nil)
        
    }
}

extension StoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StoryDataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let story = storySampleList[indexPath.row]
        
        let cell = storyTable.dequeueReusableCell(withIdentifier: "StoryCell") as! StoryCell
        
        cell.storyImage.image = UIImage(named: "33")
        
        
        cell.storyTitleLabel.text = "\(StoryDataSet[indexPath.row].title)"
        cell.nameLabel.text = "\(StoryDataSet[indexPath.row].nickname)"
        cell.dateLabel.text = "\(StoryDataSet[indexPath.row].created_date)"
        
        return cell
    }
}
