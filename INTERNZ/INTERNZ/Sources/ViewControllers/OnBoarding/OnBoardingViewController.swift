//
//  OnBoarding1ViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 02/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    
    @IBOutlet var onBoardingBannerCV: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBanner()
        
        onBoardingBannerCV.delegate = self
        onBoardingBannerCV.dataSource = self
        
    }
    
    
    private func setBanner(){
        
        let banner1 = BoardingBanner(bannerImg: "onboarding1")
        let banner2 = BoardingBanner(bannerImg: "onboarding2")
        let banner3 = BoardingBanner(bannerImg: "onboarding3")
        
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.onBoardingBannerList = [banner1, banner2, banner3]
        
    }
    
    
}

extension OnBoardingViewController: UICollectionViewDelegate {
    
}

extension OnBoardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return 0 }
        
        return delegate.onBoardingBannerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingBannerCell", for: indexPath) as! OnBoardingBannerCell
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return UICollectionViewCell() }
        
        let banner = delegate.onBoardingBannerList[indexPath.row]
        
        bannerCell.boardingImageView?.image = banner.bannerImg
        
//        bannerCell.boardingImageView = banner.bannerImg
        
        return bannerCell
        
//        let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
//
//        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return UICollectionViewCell() }
//
//        let banner = delegate.bannerList[indexPath.row]
//
//        bannerCell.corpImage?.image = banner.corpImg
//        bannerCell.corpNameLabel.text = banner.corpName
//        bannerCell.jobLabelName.text = banner.jobName
//        bannerCell.dateLabel.text = banner.day
//
//        bannerCell.cellView.setViewShadow()
//
//        return bannerCell
    }
    
    
}
