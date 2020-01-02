//
//  TimelineListViewController.swift
//  INTERNZ
//
//  Created by 박주연 on 27/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit


class TimelineListViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var TimelineListTable: UITableView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var topicdateLabel: UILabel!
    
    var TimelinesStorySampleList:[TimelinesStory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //카테고리 버튼 라운드
        categoryLabel.setCornerRadius()
        setTimelinesStorySampleData()
        
        TimelineListTable.reloadData()
        TimelineListTable.dataSource = self
        TimelineListTable.delegate = self
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension TimelineListViewController{
    
    func setTimelinesStorySampleData(){
        
        let story1 = TimelinesStory(title: "1영화번역가는 AI 때문에 사라질 직업인가.", name:"한한한", date:"20.01.01", storyImgName: "33")
        
        let story2 = TimelinesStory(title: "2영화번역가는 AI 때문에 사라질 직업인가.", name:"한한한", date:"20.01.01", storyImgName: "33")
        
        let story3 = TimelinesStory(title: "3영화번역가는 AI 때문에 사라질 직업인가.", name:"한한한", date:"20.01.01", storyImgName: "33")
        
        let story4 = TimelinesStory(title: "4영화번역가는 AI 때문에 사라질 직업인가.", name:"한한한", date:"20.01.01", storyImgName: "33")
        
        let story5 = TimelinesStory(title: "5영화번역가는 AI 때문에 사라질 직업인가.", name:"한한한", date:"20.01.01", storyImgName: "33")
        
        TimelinesStorySampleList = [story1, story2, story3, story4, story5]
    }
}

// TimelinesStory를 눌렀을 때 또 다른 페이지로 이동하는 코드이므로 아직 하지 않음. 추가되면 할 예정
//extension TimelineListViewController: UITableViewDelegate{
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let dvc = storyboard?.instantiateInitialViewController(identifier: "TimelineListViewController")as! Sto
//
//    }
//}

extension TimelineListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TimelinesStorySampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TimelineListTable.dequeueReusableCell(withIdentifier: "TimelineStoryTableViewCell")as! TimelineStoryTableViewCell
        
        let TimelineStory = TimelinesStorySampleList[indexPath.row]
        
        cell.storyTitleLabel.text = TimelineStory.storyTitle
        cell.nameLabel.text = TimelineStory.name
        cell.dateLabel.text = TimelineStory.date
        cell.storyImage.image = TimelineStory.storyImg
        
        return cell
    }
}
