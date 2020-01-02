//
//  StoryDetailViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 25/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class StoryDetailViewController: UIViewController {
    
    var storyString: String?
    var writerString: String?
    var storyIdx: Int!
    
    @IBOutlet weak var storyTitleLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var scrapButton: UIButton!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    
    var isScrap:Bool = false
    
//    var StoryDataSet = [StoryResponseString.StoryDataClass]()
    var storyDetailDataSet = [storyDetailDataClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("storyIdx????", storyIdx)
        
        setContents()
        
        detailLabel.text = "detail"
        
        storyTitleLabel.setMultiLine()
        detailLabel.setMultiLine()
        
        followButton.layer.cornerRadius = 10
        
        downloadStoryDetailData()
    }
    
    
    @IBAction func doScrap(_ sender: UIButton) {
        
        if isScrap == false {
            self.scrapButton.setImage(UIImage(named: "scrapFillIc"), for: .normal)
            isScrap = true
        } else {
            self.scrapButton.setImage(UIImage(named: "scrapIc"), for: .normal)
            isScrap = false
        }
    }
    
    func setContents(){
        storyTitleLabel.text = storyString
        writerLabel.text = writerString
    }
    
    func downloadStoryDetailData(){
        
        StoryListService.shared.StoryDetail(self.storyIdx) {
            
            response in
            
            switch response{
            case .success(let data):
//                print("data????", data)
                self.storyDetailDataSet = data as! [storyDetailDataClass]
                print(self.storyDetailDataSet)
                self.storyTitleLabel.text = self.storyDetailDataSet[0].title
                self.detailLabel.text = self.storyDetailDataSet[0].content
                self.writerLabel.text = self.storyDetailDataSet[0].nickname
                self.dateLabel.text = self.storyDetailDataSet[0].created_date
                self.commentCountLabel.text = String(self.storyDetailDataSet[0].comment_count)
                self.nicknameLabel.text = self.storyDetailDataSet[0].nickname
                self.introduceLabel.text = self.storyDetailDataSet[0].introduce
                
                
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
    
    
    
    // 뒤로가기
    @IBAction func goToBack(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToComment(_ sender: UIButton) {
        let dvc = storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        
        let navigationController = UINavigationController(rootViewController: dvc)
        
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
