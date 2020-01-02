//
//  FollowerViewController.swift
//  INTERNZ
//
//  Created by 박주연 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import Kingfisher

class FollowerViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var followTable: UITableView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var isFollowing: Bool!
    
    var followStorySampleList:
        [Follow] = []
    
    var followDataSet = [followDataClass]()
    //    var commentDataSet = [commentDataClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //topbanner 네비게이션 바 색깔과 동일하게 지정
        //        topbannerUIView.backgroundColor = UIColor.marigold
        
        
        print("isFollwing?? ", self.isFollowing)
        
        setfollowStorySampleData()
        
        followTable.reloadData()
        
        followTable.dataSource = self
        followTable.delegate = self
        
        
        if self.isFollowing == true {
            self.titleLabel.text = "팔로잉"
            downloadFollowingData()
        } else {
            self.titleLabel.text = "팔로워"
        }
        
        
        
        
    }
    
    
    @IBAction func goBack(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func downloadFollowingData(){
        print("@@@@@ start downloading following data @@@@@")
        
        FollowService.followShared.followingList {
            
            response in
            
            switch response{
            case .success(let data):
                print("data????", data)
                self.followDataSet = data as! [followDataClass]
                self.followTable.reloadData()
                
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
    
    

}





extension FollowerViewController{
    
    func setfollowStorySampleData(){
        
        let follow1 = Follow(name: "1name", introduce: "서비스 기획과 리서치를 좋아하는 UXUI 디자이너입니다입니…", followImgName: "profileImg1")
        
        let follow2 = Follow(name: "2name", introduce: "서비스 기획과 리서치를 좋아하는 UXUI 디자이너입니다입니…", followImgName: "profileImg1")
        
        let follow3 = Follow(name: "3name", introduce: "서비스 기획과 리서치를 좋아하는 UXUI 디자이너입니다입니…", followImgName: "profileImg1")
        
        let follow4 = Follow(name: "4name", introduce: "서비스 기획과 리서치를 좋아하는 UXUI 디자이너입니다입니…", followImgName: "profileImg1")
        
        let follow5 = Follow(name: "5name", introduce: "서비스 기획과 리서치를 좋아하는 UXUI 디자이너입니다입니…", followImgName: "profileImg1")
        
        followStorySampleList = [follow1, follow2, follow3, follow4, follow5]
    }
}

extension FollowerViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followDataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = followTable.dequeueReusableCell(withIdentifier: "FollowTableViewCell")as!FollowTableViewCell
    
        let follow = followDataSet[indexPath.row]
        
        cell.nameLabel.text = follow.nickname
        cell.followcontentLabel.text = follow.introduce
        
        let urlStr = follow.frontImage
        let url = URL(string: urlStr)
        cell.followImgView.kf.setImage(with: url)
        
        return cell
    }
}
