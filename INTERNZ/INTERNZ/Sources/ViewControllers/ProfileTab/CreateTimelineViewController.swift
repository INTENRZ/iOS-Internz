//
//  CreateTimelineViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 30/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class CreateTimelineViewController: UIViewController {
    
    
    @IBOutlet weak var startSelectButton: UIButton!
    
    @IBOutlet weak var endSelectButton: UIButton!
    
    var isClickedDatePicker:Bool = false
    var isClickedSortBtn: Bool = false
    
    
    var picker = UIView()
    
    var datePicker = UIDatePicker()
    
    @IBOutlet weak var InternButton: UIButton!
    @IBOutlet weak var activeButton: UIButton!
    @IBOutlet weak var contestButton: UIButton!
    @IBOutlet weak var groupButton: UIButton!
    @IBOutlet weak var licenseButton: UIButton!
    @IBOutlet weak var guitarButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startSelectButton.setBorderGray()
        endSelectButton.setBorderGray()
        
        setCategoryButton()
        
    }
    
    func setCategoryButton(){
        self.InternButton.setCategoryGray()
        self.activeButton.setCategoryGray()
        self.contestButton.setCategoryGray()
        self.groupButton.setCategoryGray()
        self.licenseButton.setCategoryGray()
        self.guitarButton.setCategoryGray()
    }
    
    
    @IBAction func startSelect(_ sender: UIButton) {
        createPicker()
    }
    
    @IBAction func endSelect(_ sender: UIButton) {
        createPicker()
    }
    
    func createPicker(){
        self.picker.isHidden = false
        
        self.picker.frame = CGRect(x: 0, y: view.frame.height - 260, width: view.frame.width, height: 260)
        view.addSubview(picker)
        
        let btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.clickDoneButton))
        let barAccessory = UIToolbar(frame: CGRect(x: 0, y: 0, width: picker.frame.width, height: 44))
        
        barAccessory.barStyle = UIBarStyle.default
        barAccessory.isTranslucent = true
        barAccessory.items = [btnDone]
        
        self.picker.addSubview(barAccessory)
        
        self.datePicker.frame = CGRect(x: 0, y: barAccessory.frame.height, width: view.frame.width, height: picker.frame.height - barAccessory.frame.height)
        self.datePicker.datePickerMode = .date
        
        self.picker.addSubview(datePicker)
        
    }
    
    // 뒤로 가기
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func clickDoneButton(){
        print("click done button")
        self.picker.isHidden = true
    }
    
    
    @IBAction func selectButton(_ sender: UIButton) {
        
        if sender.layer.borderColor == UIColor.marigold.cgColor {
            sender.disSelectFavor()
        } else {
            sender.selectFavor()
        }
        
    }
    
    
    
    
    
}
