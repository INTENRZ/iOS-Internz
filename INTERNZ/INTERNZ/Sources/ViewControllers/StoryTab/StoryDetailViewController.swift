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
    
    @IBOutlet weak var storyTitleLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var followButton: UIButton!
    
    
    @IBOutlet weak var scrapButton: UIButton!
    
    @IBOutlet weak var detailLabel: UILabel!
    var isScrap:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContents()
        
        storyTitleLabel.lineBreakMode = .byWordWrapping
        storyTitleLabel.numberOfLines = 0
        
        detailLabel.text = "저는 이번 여름 방학 2개월간 키오스크 및 선불 카드 관련 서비스를 제공하는 스타트업에서 마케팅 인턴으로 근무하였습니다. 특히, 마케팅 인턴으로 근무하면서 해외 여행객들에게 ‘나만의 교통카드’ 서비스의 인지도 향상 시키기 위한 SNS 콘텐츠를 기획한 이야기를 해보겠습니다. 초반에는 베트남 여행객들을 타겟으로 서비스 인지도를 높이기 위한 마케팅 방안을 구상해야 했지만 베트남어를 몰라 타겟을 분석하는 데에  많은 어려움이 있었습니다. 저는 생생한 자료를 얻는 것이 중요하다고 생각하여, 회사 주변 베트남 쌀국수 가게에 직접 찾아가 사장님의 허락을 받고 베트남 아르바이트생과 면담할 기회를 얻어냈습니다. 실제 현지인 분과의 면담을 통해 BTS와 같은 K-POP 아이돌 관련 콘텐츠가 효과적일 것이라는 인사이트를 얻게 되었습니다. 또한, 한국의 베트남 유학생 페이스북 페이지를 알게 되어 자료 수집과 언어 문제를 해결하였습니다. 이후에 저는 K-POP과 교통카드를 엮은 다양한 콘텐츠를 직접 만들어 베트남 유명 페이스북 페이지에 업로드하였습니다. "
        
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.numberOfLines = 0
        
        followButton.layer.cornerRadius = 10
        
        
        
    }
    
    
    @IBAction func doScrap(_ sender: UIButton) {
        
        if isScrap == false {
            self.scrapButton.setImage(UIImage(named: "scrapFillIc"), for: .normal)
            isScrap = true
        } else {
            self.scrapButton.setImage(UIImage(named: "scrapIc"), for: .normal)
            isScrap = false
        }

    }
    
    func setContents(){
        storyTitleLabel.text = storyString
        writerLabel.text = writerString
    }
    
    
    // 뒤로가기
    @IBAction func goToBack(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func goToComment(_ sender: UIButton) {
        
        print("tab comment btn")
        
     
        
        let dvc = storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        
        let navigationController = UINavigationController(rootViewController: dvc)
        
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
        
    }
    
}
