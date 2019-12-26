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
    
    @IBOutlet weak var bannerCV: UICollectionView!
    
    @IBOutlet weak var paging: CHIPageControlAleppo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        bannerCV.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.007)
        
        // collection view 에 들어갈 sample data setting
        setBanner()

        bannerCV.delegate = self
        bannerCV.dataSource = self
        
        bannerCV.isPagingEnabled = true
        
    }
    
    private func setBanner(){
        let banner1 = Banner(corpImgName: "corpImg1", corpName: "네이버", jobName: "iOS 개발자", day: "d-20")
        let banner2 = Banner(corpImgName: "corpImg1", corpName: "네이버", jobName: "iOS 개발자", day: "d-20")
        let banner3 = Banner(corpImgName: "corpImg1", corpName: "네이버", jobName: "iOS 개발자", day: "d-20")
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.bannerList = [banner1, banner2, banner3]
        
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return 0 }
        return delegate.bannerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return UICollectionViewCell() }
        
        let banner = delegate.bannerList[indexPath.row]
        
        bannerCell.corpImage?.image = banner.corpImg
        bannerCell.corpNameLabel.text = banner.corpName
        bannerCell.jobLabelName.text = banner.jobName
        bannerCell.dateLabel.text = banner.day
        
        bannerCell.cellView.layer.cornerRadius = 7
        bannerCell.cellView.layer.shadowColor = UIColor.black.cgColor
        bannerCell.cellView.layer.shadowOpacity = 0.1
        bannerCell.cellView.layer.shadowOffset = .zero
        bannerCell.cellView.layer.shadowRadius = 2
        
        return bannerCell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        print(currentPage)
        self.paging.set(progress: currentPage, animated: true)
    }
    
}


