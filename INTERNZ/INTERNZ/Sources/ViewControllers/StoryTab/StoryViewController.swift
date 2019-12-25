//
//  StoryViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    
    @IBOutlet weak var storyTable: UITableView!
    
    var storySampleList: [Story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStorySampleData()
        
        storyTable.reloadData()
        
        storyTable.dataSource = self
        storyTable.delegate = self
        
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
        
        let dvc = storyboard?.instantiateViewController(identifier: "StoryDetailViewController") as! StoryDetailViewController
        
        let story = storySampleList[indexPath.row]
        
        dvc.storyString = story.storyTitle
        dvc.writerString = story.name
        
        navigationController?.pushViewController(dvc, animated: true)
        
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
