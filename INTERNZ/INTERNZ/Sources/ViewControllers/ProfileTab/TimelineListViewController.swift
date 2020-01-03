//
//  TimelineListViewController.swift
//  INTERNZ
//
//  Created by 박주연 on 27/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import Kingfisher


class TimelineListViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var TimelineListTable: UITableView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var topicdateLabel: UILabel!
    
    @IBOutlet weak var writeButton: UIButton!
    
    
    var TimelinesStorySampleList:[TimelinesStory] = []
    
    var timelineIdx: Int!
    var timelineTitle: String!
    
    var timelineStoryDataSet = [timelineStoryDataClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("timelineIdx??", timelineIdx)
        print("timelineTitle??", timelineTitle)
        
        self.topicLabel.text = self.timelineTitle
        
        //카테고리 버튼 라운드
        categoryLabel.setCornerRadius()
        
        TimelineListTable.reloadData()
        TimelineListTable.dataSource = self
        TimelineListTable.delegate = self
        
        downloadTimelineStoryData()
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func downloadTimelineStoryData(){
        
        TimelineListService.timelineShared.timelineStoryList(self.timelineIdx) {
            
            response in
            
            switch response {
                
            case .success(let data):
                print("data????", data)
                self.timelineStoryDataSet = data as! [timelineStoryDataClass]
//                print(self.timelineStoryDataSet)
                self.TimelineListTable.reloadData()

            case.networkFail:
                print("error") //찍어보기 확인
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            }
        }
    }
    
    // 타임라인 글쓰기
    @IBAction func goWriteView(_ sender: Any) {
        let dvc = storyboard?.instantiateViewController(identifier: "CreateTimelineViewController") as! CreateTimelineViewController
        
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: nil)
    }
    
    
    // 타임라인에 해당하는 스토리 작성 뷰로 이동
    @IBAction func goStoryWriteView(_ sender: UIButton) {
        
        let dvc = storyboard?.instantiateViewController(identifier: "WritingStoryViewController") as! WritingStoryViewController
        
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: nil)
    }
}


extension TimelineListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return timelineStoryDataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TimelineListTable.dequeueReusableCell(withIdentifier: "TimelineStoryTableViewCell")as! TimelineStoryTableViewCell
        
        let timelineStory = timelineStoryDataSet[indexPath.row]
        
        cell.storyTitleLabel.text = timelineStory.title
        cell.dateLabel.text = timelineStory.createdDate
        
        return cell
    }
}
