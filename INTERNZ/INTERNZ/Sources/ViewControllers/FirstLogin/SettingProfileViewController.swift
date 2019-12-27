
//
//  SettingProfileViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 28/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class SettingProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileUIView: UIView!
    
    @IBOutlet weak var introduceTextView: UITextView!
    
    @IBOutlet weak var startButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "프로필 설정"
        
        self.profileUIView.layer.backgroundColor = UIColor.whiteFour.cgColor
        self.profileUIView.layer.cornerRadius = 40
        
//        self.introduceTextView.becomeFirstResponder()
//        self.introduceTextView.resignFirstResponder()
        
        self.introduceTextView.layer.borderWidth = 1
        self.introduceTextView.layer.borderColor = UIColor.whiteFour.cgColor
        self.introduceTextView.layer.cornerRadius = 5
        
        self.introduceTextView.text = "sample text"
        self.introduceTextView.textColor = UIColor.whiteFour
        
        self.introduceTextView.delegate = self
        
    
        self.startButton.layer.backgroundColor = UIColor.whiteFour.cgColor
        self.startButton.layer.cornerRadius = 5
        
        
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.introduceTextView.becomeFirstResponder()
        self.introduceTextView.resignFirstResponder()
    }
    

   

}


extension SettingProfileViewController: UITextViewDelegate{

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.whiteFour {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "place holder"
            textView.textColor = UIColor.lightGray
        }
    }
    
}
