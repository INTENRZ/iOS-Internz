//
//  FollowerViewController.swift
//  INTERNZ
//
//  Created by 박주연 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class FollowerViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var followTable: UITableView!
    
    var followStorySampleList:
        [Follow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //topbanner 네비게이션 바 색깔과 동일하게 지정
        //        topbannerUIView.backgroundColor = UIColor.marigold
        
        
        
        
        setfollowStorySampleData()
        
        followTable.reloadData()

        followTable.dataSource = self
        followTable.delegate = self
        
       // print(followStorySampleList.count)
        
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
        
        return followStorySampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = followTable.dequeueReusableCell(withIdentifier: "FollowTableViewCell")as!FollowTableViewCell
        
        let Follow = followStorySampleList[indexPath.row]
        
        cell.nameLabel.text = Follow.name
        cell.followcontentLabel.text = Follow.introduce
//        cell.followButton.button = Follow.followBtn
        cell.followImgView.image = Follow.followImg
        
        return cell
    }
}
