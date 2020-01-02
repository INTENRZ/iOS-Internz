//
//  HomeViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import CHIPageControl

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var bannerCV: UICollectionView!
    @IBOutlet weak var paging: CHIPageControlAleppo!
    @IBOutlet weak var profileBannerCV: UICollectionView!
    @IBOutlet weak var storyWholeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.homeView.backgroundColor = UIColor(patternImage: UIImage(named: "bannerImg")!)
        
        // tab bar item 의 title 설정
        if let downcastStrings = self.tabBarController?.tabBar.items
        {
            downcastStrings[0].title = "홈"
            downcastStrings[1].title = "공고"
            downcastStrings[2].title = "스토리"
            downcastStrings[3].title = "프로필"
        }
        
        // tab bar item image 설정
        self.tabBarController?.tabBar.items![0].image = UIImage(named: "tabHomeActiveIc")
        self.tabBarController?.tabBar.items![1].image = UIImage(named: "tabNoticeIc")
        self.tabBarController?.tabBar.items![2].image = UIImage(named: "tabStoryIc")
        self.tabBarController?.tabBar.items![3].image = UIImage(named: "tabProfileIc")
        
        // tab bar color 설정
        self.tabBarController?.tabBar.selectedImageTintColor = UIColor.marigold
        
        // 맞춤 공고 banner 설정
        bannerCV.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.007)
        
        // 공고 collection view 에 들어갈 sample data setting
        setBanner()
        bannerCV.delegate = self
        bannerCV.dataSource = self
        bannerCV.isPagingEnabled = true
        
        // 프로필 banner 설정
        profileBannerCV.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.007)
        
        // 프로필 collection view 에 들어갈 sample profile data setting
        setProfileBanner()
        
        profileBannerCV.delegate = self
        profileBannerCV.dataSource = self
        
        storyWholeView.setViewShadow()
    }
    
    private func setBanner(){
        let banner1 = Banner(corpImgName: "corpImg1", corpName: "네이버11", jobName: "iOS 개발자", day: "d-20")
        let banner2 = Banner(corpImgName: "corpImg1", corpName: "네이버22", jobName: "iOS 개발자", day: "d-20")
        let banner3 = Banner(corpImgName: "corpImg1", corpName: "네이버33", jobName: "iOS 개발자", day: "d-20")
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.bannerList = [banner1, banner2, banner3]
    }
    
    private func setProfileBanner(){
        let profileBanner1 = ProfileBanner(profileImgName: "profileImg1", userName: "핫가이", introduce: "영앤리치 빅앤핸섬")
        let profileBanner2 = ProfileBanner(profileImgName: "profileImg1", userName: "핫가이", introduce: "영앤리치 빅앤핸섬")
        let profileBanner3 = ProfileBanner(profileImgName: "profileImg1", userName: "핫가이", introduce: "영앤리치 빅앤핸섬")
        let profileBanner4 = ProfileBanner(profileImgName: "profileImg1", userName: "핫가이", introduce: "영앤리치 빅앤핸섬")
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        delegate?.profileBannerList = [profileBanner1, profileBanner2, profileBanner3, profileBanner4]
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return 0 }
        
        if collectionView == bannerCV {
            return delegate.bannerList.count
        } else {
            return delegate.profileBannerList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == bannerCV {
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
            
            guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return UICollectionViewCell() }
            
            let banner = delegate.bannerList[indexPath.row]
            
            bannerCell.corpImage?.image = banner.corpImg
            bannerCell.corpNameLabel.text = banner.corpName
            bannerCell.jobLabelName.text = banner.jobName
            bannerCell.dateLabel.text = banner.day
            
            bannerCell.cellView.setViewShadow()
            
            return bannerCell
            
        } else {
            
            let profileBannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileBannerCell", for: indexPath) as! ProfileBannerCell
            
            guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return UICollectionViewCell() }
            
            let profileBanner = delegate.profileBannerList[indexPath.row]
            
            profileBannerCell.profileImage?.image = profileBanner.profileImg
            profileBannerCell.nameLabel.text = profileBanner.userName
            profileBannerCell.introduceLabel.text = profileBanner.introduce
            
            profileBannerCell.cellView.setViewShadow()
            
            return profileBannerCell
        }
    }
}

extension HomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = bannerCV.contentOffset.x
        let w = bannerCV.bounds.size.width
        let currentPage = Int(ceil(x/w))
        print(currentPage)
        self.paging.set(progress: currentPage, animated: true)
    }
}
