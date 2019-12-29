//
//  CreateTimelineViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 30/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class CreateTimelineViewController: UIViewController {
    
    //    var datePicker: UIDatePicker!
//    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var startSelectButton: UIButton!
    
    var isClickedDatePicker:Bool = false
    var isClickedSortBtn: Bool = false

    
    var picker = UIView()
    
    var datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startSelectButton.setBorderGray()
        
    }
    
    
    @IBAction func startSelect(_ sender: UIButton) {
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
        
        self.picker.addSubview(datePicker)
        
    }
    
    
    
    @objc func clickDoneButton(){
        print("click done button")
        self.picker.isHidden = true
    }
    
}
