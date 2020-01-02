//
//  MessageSendViewController.swift
//  INTERNZ
//
//  Created by 박주연 on 30/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class MessageSendViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "쪽지보내기"
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let closeButton = UIBarButtonItem(image: UIImage(named: "closeIc"), style: .plain, target: self, action: #selector(goBack))
        closeButton.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = closeButton
        
        let sendButton = UIBarButtonItem(title: "전송", style: .plain, target: self, action: #selector(send))
        sendButton.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = sendButton
        
        let textView = UITextView()
        textView.frame = CGRect(x: 16, y: 88, width: 343, height: 388)
        textView.backgroundColor = UIColor.white0
        textView.textColor = .darkGreyTwo
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false // for auto layout
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        textView.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        textView.delegate = self
        textView.isScrollEnabled = false
        
        textViewDidChange(textView)
    }
    
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func send(){
        print("tab send")
    }
}

extension MessageSendViewController: UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity) // ---- 1
        let estimatedSize = textView.sizeThatFits(size) // ---- 2
        textView.constraints.forEach { (constraint) in // ---- 3
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}
