//
//  SettingFavorViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 27/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class SettingFavorViewController: UIViewController {
    
    @IBOutlet weak var completeButton: UIButton!
    
    var favorCnt: Int = 0
    //    var selectedJobArr:[String] = []
    var selectOne: String = ""
    var selectTwo: String = ""
    var selectThree: String = ""
    
    // 관심 직무 버튼
    @IBOutlet weak var gihwaekBtn: UIButton!
    @IBOutlet weak var insaBtn: UIButton!
    @IBOutlet weak var hwaegyeBtn: UIButton!
    @IBOutlet weak var gyoyukBtn: UIButton!
    @IBOutlet weak var gumaeBtn: UIButton!
    @IBOutlet weak var hongboBtn: UIButton!
    @IBOutlet weak var gwangoBtn: UIButton!
    @IBOutlet weak var guknaeBtn: UIButton!
    @IBOutlet weak var haewaeBtn: UIButton!
    @IBOutlet weak var youngupBtn: UIButton!
    @IBOutlet weak var marketingBtn: UIButton!
    @IBOutlet weak var serviceBtn: UIButton!
    @IBOutlet weak var sangpumBtn: UIButton!
    @IBOutlet weak var gongjeongBtn: UIButton!
    @IBOutlet weak var saengsanBtn: UIButton!
    @IBOutlet weak var pumzilBtn: UIButton!
    @IBOutlet weak var youtongBtn: UIButton!
    @IBOutlet weak var yeonguBtn: UIButton!
    @IBOutlet weak var designBtn: UIButton!
    @IBOutlet weak var muyeokBtn: UIButton!
    @IBOutlet weak var itBtn: UIButton!
    @IBOutlet weak var gongmuoneBtn: UIButton!
    @IBOutlet weak var researchBtn: UIButton!
    @IBOutlet weak var consultingBtn: UIButton!
    @IBOutlet weak var guitarBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "맞춤설정"
        
        self.completeButton.layer.cornerRadius = 5
        
        initBtn()
    }
    
    @IBAction func gotoProfileSetting(_ sender: UIButton) {
        
        if favorCnt == 3 {
            let dvc = storyboard?.instantiateViewController(identifier: "SettingProfileVC") as! SettingProfileViewController
            
            dvc.selectOne = self.selectOne
            dvc.selectTwo = self.selectTwo
            dvc.selectThree = self.selectThree
            
            navigationController?.pushViewController(dvc, animated: true)
            
        } else {
            let alert = UIAlertController(title: "선택 오류!", message: "관심 직무를 세 개 선택해 주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    // 버튼 초기 상태 setting
    func initBtn(){
        
        gihwaekBtn.setFavor()
        insaBtn.setFavor()
        hwaegyeBtn.setFavor()
        gyoyukBtn.setFavor()
        gumaeBtn.setFavor()
        hongboBtn.setFavor()
        gwangoBtn.setFavor()
        guknaeBtn.setFavor()
        haewaeBtn.setFavor()
        youngupBtn.setFavor()
        marketingBtn.setFavor()
        serviceBtn.setFavor()
        sangpumBtn.setFavor()
        gongjeongBtn.setFavor()
        saengsanBtn.setFavor()
        pumzilBtn.setFavor()
        youtongBtn.setFavor()
        yeonguBtn.setFavor()
        designBtn.setFavor()
        muyeokBtn.setFavor()
        itBtn.setFavor()
        gongmuoneBtn.setFavor()
        researchBtn.setFavor()
        consultingBtn.setFavor()
        guitarBtn.setFavor()
    }
    
    @IBAction func selectFavor(_ sender: UIButton) {
        
        if sender.layer.borderColor == UIColor.marigold.cgColor {
            sender.disSelectFavor()
            favorCnt -= 1
        } else {
            
            if (favorCnt < 3){
                sender.selectFavor()
                favorCnt += 1
                print(favorCnt)
                
                switch favorCnt {
                case 1:
                    selectOne = sender.titleLabel?.text ?? ""
                case 2:
                    selectTwo = sender.titleLabel?.text ?? ""
                case 3:
                    selectThree = sender.titleLabel?.text ?? ""
                default:
                    break
                }
            }
        }
    } // selectFavor()
    
    
    
    
}

