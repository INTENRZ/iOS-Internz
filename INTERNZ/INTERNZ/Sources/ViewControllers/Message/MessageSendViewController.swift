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
        
        
        
//        var addItem: UIBarButtonItem{
//               let addImage = UIImage(named: "closeIc")
//               let addButton = UIButton(type: UIButton.ButtonType.custom)
//               addButton.setBackgroundImage(addImage, for: UIControl.State())
//               addButton.frame = CGRect(x: 0, y: 0, width: (addImage?.size.width)!, height: (addImage?.size.height)!)
//               let addItem = UIBarButtonItem(customView: addButton)
//               return addItem
//           }

//        var contactsItem: UIBarButtonItem {
//               let contactsImage = UIImage(named: "closeIc")
//               let contactsButton = UIButton(type: UIButton.ButtonType.custom)
//               contactsButton.setBackgroundImage(contactsImage, for: UIControl.State())
//               contactsButton.frame = CGRect(x: 0, y: 0, width: (contactsImage?.size.width)!, height: (contactsImage?.size.height)!)
//               let contactsItem = UIBarButtonItem(customView: contactsButton)
//               return contactsItem
//        }
        
//        navigationItem.leftBarButtonItems = [contactsItem]
//        navigationItem.rightBarButtonItems = [addItem]

        
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

