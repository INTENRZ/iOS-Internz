//
//  SortSelectViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 03/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class SortSelectViewController: UIViewController {

    var favorCnt: Int = 0
    
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

    @IBOutlet weak var completeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBtn()
        self.completeButton.layer.cornerRadius = 5
        self.completeButton.layer.backgroundColor = UIColor.gray.cgColor
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
            self.completeButton.layer.backgroundColor = UIColor.gray.cgColor
            
        } else {
            
            if (favorCnt < 1){
                sender.selectFavor()
                favorCnt += 1
                self.completeButton.layer.backgroundColor = UIColor.marigold.cgColor
            }
        }
    } // selectFavor
    
    
    @IBAction func clickCompleteButton(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    


}
