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
    
    var dataArray = ["최신순", "마감순" ,"sss", "sssss"] // picker view array
    
    var isClickedSortBtn:Bool = false
    var selectString = "최신순"
    
    
    @IBOutlet weak var storyTable: UITableView!
    
    var category: String?
    
    var storySampleList: [Story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStorySampleData()
        
        storyTable.reloadData()
        
        storyTable.dataSource = self
        storyTable.delegate = self
        
        //        print(category ?? "")
        
        self.sortButton.titleLabel?.text = selectString
        
    }
    
    @IBAction func doSortStory(_ sender: UIButton) {
        
        // 1. 전체를 잡는 view 생성 + constraint 걸기
        self.picker.isHidden = false
        
        self.picker.frame = CGRect(x: 0, y: view.frame.height - 260, width: view.frame.width, height: 260)
        
        //        let picker = UIView(frame: CGRect(x: 0, y: view.frame.height - 260, width: view.frame.width, height: 260))
        
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
        let sortPicker = UIPickerView(frame: CGRect(x: 0, y: barAccessory.frame.height, width: view.frame.width, height: picker.frame.height - barAccessory.frame.height))
        sortPicker.delegate = self
        sortPicker.dataSource = self
        sortPicker.backgroundColor = UIColor.whiteFour
        
        picker.addSubview(sortPicker)
        
    }
    
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
        selectString = dataArray[pickerView.selectedRow(inComponent: 0)]
    }
    
    // PickerView 완료 버튼 클릭
    @objc func testfunc(){
        print("test")
        
        if isClickedSortBtn == false {
            self.picker.isHidden = true
            isClickedSortBtn = false
            self.sortButton.titleLabel?.text = selectString
        } else {
            self.picker.isHidden = false
            isClickedSortBtn = true
            self.sortButton.titleLabel?.text = selectString
        }
        
        
        
        
    }
}

extension StoryViewController {
    func setStorySampleData(){
        let story1 = Story(title: "test title11 테스트테스트테스트트틑ㅌ", name: "김김김", date: "12.25", storyImgName: "33")
        
        let story2 = Story(title: "test title22 타이틀 길게 가자 멀티플라인", name: "박박박", date: "12.25", storyImgName: "33")
        
        let story3 = Story(title: "test title33 테스트테스트테스트트틑ㅌ", name: "최최최", date: "12.25", storyImgName: "33")
        
        let story4 = Story(title: "test title44 테스트테스트테스트트틑ㅌ", name: "name", date: "12.25", storyImgName: "33")
        
        let story5 = Story(title: "test title55 테스트테스트테스트트틑ㅌ", name: "name", date: "12.25", storyImgName: "33")
        
        
        storySampleList = [story1, story2, story3, story4, story5]
    }
}

extension StoryViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let story = storySampleList[indexPath.row]
        
        let dvc = storyboard?.instantiateViewController(identifier: "StoryDetailViewController") as! StoryDetailViewController
        
        dvc.storyString = story.storyTitle
        dvc.writerString = story.name
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: nil)
        
    }
    
}

extension StoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storySampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let story = storySampleList[indexPath.row]
        
        let cell = storyTable.dequeueReusableCell(withIdentifier: "StoryCell") as! StoryCell
        
        cell.storyTitleLabel.text = story.storyTitle
        cell.nameLabel.text = story.name
        cell.dateLabel.text = story.date
        cell.storyImage.image = story.storyImg
        
        
        return cell
    }
    
    
}
