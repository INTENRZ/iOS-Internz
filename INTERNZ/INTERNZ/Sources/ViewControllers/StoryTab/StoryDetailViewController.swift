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
    
    var isClickedFollow:Bool = false
    
//    var StoryDataSet = [StoryResponseString.StoryDataClass]()
    var storyDetailDataSet = [storyDetailDataClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTitleLabel.setMultiLine()
        detailLabel.setMultiLine()
        
        followButton.layer.cornerRadius = 10
        followButton.backgroundColor = UIColor.gray
        
        downloadStoryDetailData()
        
        self.introduceLabel.setMultiLine()
    }
    
    
    @IBAction func doScrap(_ sender: UIButton) {
        
        if isScrap == false {
            self.scrapButton.setImage(UIImage(named: "scrapFillIc"), for: .normal)
            isScrap = true
            
            let alert = UIAlertController(title: "스크랩 성공!", message: "\(self.nicknameLabel.text!) 님이 작성한 글이 스크랩 리스트에 추가되었습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            self.scrapButton.setImage(UIImage(named: "scrapIc"), for: .normal)
            isScrap = false
            
            let alert = UIAlertController(title: "스크랩 취소!", message: "스크랩을 취소합니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func clickFollowButton(_ sender: UIButton) {
        if self.isClickedFollow == false {
            self.followButton.backgroundColor = UIColor.marigold
            self.isClickedFollow = true
            
            let alert = UIAlertController(title: "팔로우 추가!", message: "\(self.nicknameLabel.text!) 님을 팔로우하기 시작합니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
        } else {
            self.followButton.backgroundColor = UIColor.gray
            self.isClickedFollow = false
            
            let alert = UIAlertController(title: "팔로우 취소!", message: "\(self.nicknameLabel.text!) 님 팔로우를 취소합니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
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
    
    // 댓글 창으로 이동
    @IBAction func goToComment(_ sender: UIButton) {
        let dvc = storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        
        dvc.storyIdx = self.storyIdx
        
        let navigationController = UINavigationController(rootViewController: dvc)
        
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
