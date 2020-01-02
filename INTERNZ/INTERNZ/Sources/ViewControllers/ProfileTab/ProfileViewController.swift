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
}


class ProfileViewController: UIViewController,UITableViewDelegate {
    
    @IBOutlet weak var navigaionItem: UINavigationItem!
    
    @IBOutlet weak var ProfileListTable: UITableView!
    @IBOutlet weak var followButton: UIButton!
    
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var followercountButton: UIButton!
    @IBOutlet weak var followingcountButton: UIButton!
    
    @IBOutlet weak var introduceLabel: UILabel!
    
    @IBOutlet weak var workselect1Label: UILabel!
    @IBOutlet weak var workselect2Label: UILabel!
    @IBOutlet weak var workselect3Label: UILabel!
    
    
    @IBOutlet weak var plusButton: UIButton!
    
    
    var ProfileStorySampleList:
        [ProfileStory] = []
    
    var timelineDataSet = [timelineDataClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션을 투명하게 하는 방법
        let naviBar = navigationController?.navigationBar
        let naviBarAppearence = UINavigationBarAppearance()
        naviBarAppearence.shadowColor = .none
        naviBar?.scrollEdgeAppearance = naviBarAppearence
        
        //자기소개 부분 라인 수 증가
        introduceLabel.lineBreakMode = .byWordWrapping
        introduceLabel.numberOfLines = 0
        
        //팔로우 버튼 라운드
        followButton.setCornerRadius()
        //followButton.setBorderWidth()
        
        workselect1Label.setCornerRadius()
        workselect2Label.setCornerRadius()
        workselect3Label.setCornerRadius()
        
        ProfileListTable.dataSource = self
        ProfileListTable.delegate = self
        
        print(ProfileStorySampleList.count)
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "closeIc"), style: .plain, target: self, action: #selector(CloseBtn))
        menuButton.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = menuButton
        
        downloadTimeline()
    }
    
    func downloadTimeline(){
        
        TimelineListService.timelineShared.timelineList {
            response in
            
            switch response {
            case .success(let data):
                print("@@@@@success@@@@@")
                print(data)
                self.timelineDataSet = data as! [timelineDataClass]
                self.ProfileListTable.reloadData()
                
            case .networkFail :
                print(".networkFail")
                
            case .pathErr :
                print(".pathErr")
                
            case .requestErr(_):
                print(".requestErr")
            case .serverErr:
                print(".serverErr")
            }
            
        }
        
    }
    
    
    @objc func CloseBtn(){
        self.dismiss(animated: true)
    }
    
    
    @IBAction func followerCount(_ sender: UIButton) {
        
        let dvc = storyboard?.instantiateViewController(identifier: "FollowerViewController") as! FollowerViewController
        
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    @IBAction func followingCount(_ sender: UILabel) {
        
        let dvc = storyboard?.instantiateViewController(identifier: "FollowerViewController") as! FollowerViewController
        
        navigationController?.pushViewController(dvc, animated: true)
        
    }
    
    @IBAction func plusBtn(_ sender: UIButton) {
        
        let dvc = storyboard?.instantiateViewController(identifier: "CreateTimelineViewController") as! CreateTimelineViewController
        
        navigationController?.pushViewController(dvc, animated: true)
        
    }
    
    @IBAction func messageBtn(_ sender: Any) {
        
        let dvc = storyboard?.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        
        navigationController?.pushViewController(dvc, animated: true)
        
    }
    

}


extension ProfileViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return timelineDataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ProfileListTable.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
        
        cell.titleLabel.text = "\(timelineDataSet[indexPath.row].title)"
        cell.categoryLabel.text = "\(timelineDataSet[indexPath.row].category)"
        cell.dateLabel.text = "\(timelineDataSet[indexPath.row].end_date)"
        
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tab row")
        
        let dvc = storyboard?.instantiateViewController(identifier: "TimelineListViewController") as! TimelineListViewController
        
        navigationController?.pushViewController(dvc, animated: true)
        
        
    }
    
    
}

