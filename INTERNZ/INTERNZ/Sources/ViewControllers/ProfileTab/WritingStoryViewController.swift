//
//  WritingStoryViewController.swift
//  INTERNZ
//
//  Created by 박주연 on 30/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import Foundation

class WritingStoryViewController: UIViewController,UITextViewDelegate, UITableViewDelegate {
    
    @IBOutlet weak var myTextField: UITextView!
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "스토리"
        
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "closeIc"), style: .plain, target: self, action: #selector(CloseBtn))
        menuButton.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = menuButton
        
        let sendButton = UIBarButtonItem(title: "전송", style: .plain, target: self, action: #selector(send))
        sendButton.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = sendButton
        
        myTextField.font = UIFont.preferredFont(forTextStyle: .headline)
        myTextView.font = UIFont.preferredFont(forTextStyle: .body)
        
        addKeyboardObserver()
        myTextField.delegate = self
        myTextView.delegate = self
        
    }
    
    @objc func CloseBtn(){
        self.dismiss(animated: true)
    }
    
    @objc func send(){
        self.dismiss(animated: true)
    }
}

extension WritingStoryViewController: UITextFieldDelegate {
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(upKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(downKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func upKeyboard() {
        self.view.frame.origin.y = CGFloat(-UtilValue.keyboardHeight)
        
    }
    
    @objc func downKeyboard() {
        self.view.frame.origin.y = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    struct UtilValue {
         static let keyboardHeight = 160
    }
}
