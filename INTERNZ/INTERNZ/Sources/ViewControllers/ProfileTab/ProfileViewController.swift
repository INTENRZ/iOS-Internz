//
//  ProfileViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

extension UIView{
    
    func setCornerRadius(){
        self.layer.cornerRadius = 11
        self.clipsToBounds = true
    }
    
    //    func setBorderWidth(){
    //    self.layer.borderWidth = 100
    //        self.layer.borderColor = UIColor.marigold.cgColor
    //
    //    }
}


class ProfileViewController: UIViewController,UITableViewDelegate {
    
    
    @IBOutlet weak var ProfileListTable: UITableView!
    @IBOutlet weak var followButton: UIButton!
    
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var followercountButton: UIButton!
    @IBOutlet weak var followingcountButton: UIButton!
    
    @IBOutlet weak var introduceLabel: UILabel!
    
    @IBOutlet weak var workselect1Label: UILabel!
    @IBOutlet weak var workselect2Label: UILabel!
    @IBOutlet weak var workselect3Label: UILabel!
    
    var ProfileStorySampleList:
        [ProfileStory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //topbanner 네비게이션 바 색깔과 동일하게 지정
        //        topbannerUIView.backgroundColor = UIColor.marigold
        
        //자기소개 부분 라인 수 증가
        introduceLabel.lineBreakMode = .byWordWrapping
        introduceLabel.numberOfLines = 0
        
        //팔로우 버튼 라운드
        followButton.setCornerRadius()
        //followButton.setBorderWidth()
        
        workselect1Label.setCornerRadius()
        workselect2Label.setCornerRadius()
        workselect3Label.setCornerRadius()
        
        setProfileStorySampleData()
        
        
        ProfileListTable.reloadData()
        
        
        ProfileListTable.dataSource = self
        ProfileListTable.delegate = self
        
        print(ProfileStorySampleList.count)
        
    }
    
    
    
    
    
    @IBAction func goFollowView(_ sender: UIButton) {
        
        let dvc = storyboard?.instantiateViewController(identifier: "FollowerViewController") as! FollowerViewController
        
        navigationController?.pushViewController(dvc, animated: true)
        
    }
    
    
}

extension ProfileViewController{
    
    func setProfileStorySampleData(){
        
        let story1 = ProfileStory(title: "1NAVER SNOW Jam Studio 기획/운영팀", name:"한한한", date:"20.01.01")
        
        let story2 = ProfileStory(title: "2NAVER SNOW Jam Studio 기획/운영팀", name:"한한한", date:"20.01.01")
        
        
        let story3 = ProfileStory(title: "3NAVER SNOW Jam Studio 기획/운영팀", name:"한한한", date:"20.01.01")
        
        
        let story4 = ProfileStory(title: "4NAVER SNOW Jam Studio 기획/운영팀", name:"한한한", date:"20.01.01")
        
        
        let story5 = ProfileStory(title: "5NAVER SNOW Jam Studio 기획/운영팀", name:"한한한", date:"20.01.01")
        
        ProfileStorySampleList = [story1, story2, story3, story4, story5]
        
    }
    
}

extension ProfileViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ProfileStorySampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ProfileListTable.dequeueReusableCell(withIdentifier: "ProfileTableViewCell")as!ProfileTableViewCell
        
        let ProfileStory = ProfileStorySampleList[indexPath.row]
        
        cell.titleLabel.text = ProfileStory.profilestoryTitle
        
        cell.categoryLabel.text = ProfileStory.category
        
        cell.dateLabel.text = ProfileStory.date
        
        //        cell.titleLabel.text = ""
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tab row")
        
        let dvc = storyboard?.instantiateViewController(identifier: "TimelineListViewController") as! TimelineListViewController
        
        navigationController?.pushViewController(dvc, animated: true)
        
        
    }
    
    
}



