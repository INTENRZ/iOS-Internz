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
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func setBorderWidth(){
        //self.layer.borderWidth = 100
        //self.layer.borderColor = UIColor.marigold.cgColor
    
    }
}


class ProfileViewController: UIViewController {
    

    @IBOutlet weak var profilebackgroundView: UIView!
    @IBOutlet weak var topbannerUIView: UIView!
    @IBOutlet weak var followButton: UIButton!
    
    @IBOutlet weak var followercountLabel: UILabel!
    @IBOutlet weak var followingcountLabel: UILabel!
    
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var profilerecordView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //topbanner 네비게이션 바 색깔과 동일하게 지정
        topbannerUIView.backgroundColor = UIColor.marigold

        //자기소개 부분 라인 수 증가
        introduceLabel.lineBreakMode = .byWordWrapping
        introduceLabel.numberOfLines = 0
        
        //팔로우 버튼 라운드
        followButton.setCornerRadius()
        //followButton.setBorderWidth()
        
    }
    
}
