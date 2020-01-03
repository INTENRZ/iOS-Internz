//
//  OnBoarding1ViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 02/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit
import CHIPageControl

class OnBoardingViewController: UIViewController {
    
    
    @IBOutlet var onBoardingBannerCV: UICollectionView!
    
    @IBOutlet weak var paging: CHIPageControlAleppo!
    
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBanner()
        
        onBoardingBannerCV.delegate = self
        onBoardingBannerCV.dataSource = self
        onBoardingBannerCV.isPagingEnabled = true
        self.startButton.layer.cornerRadius = 5
        self.startButton.layer.isHidden = true
        
        self.view.backgroundColor = UIColor.white
    }
    
    
    @IBAction func goStart(_ sender: UIButton) {
        
        let loginStoryBoard : UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let loginViewController = loginStoryBoard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
        
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let x = onBoardingBannerCV.contentOffset.x
        let w = onBoardingBannerCV.bounds.size.width
        let currentPage = Int(ceil(x/w))
        
        print(currentPage)
        
        if currentPage == 2 {
            self.startButton.layer.isHidden = false
        } else {
            self.startButton.layer.isHidden = true
        }
        
        self.paging.set(progress: currentPage, animated: true)
    }
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
        
        
        return bannerCell
        
        
    }
    
    
}
