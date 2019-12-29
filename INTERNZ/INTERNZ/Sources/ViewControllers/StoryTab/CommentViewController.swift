//
//  CommentViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "댓글"
        
        let button1 = UIBarButtonItem(image: UIImage(named: "closeIc"), style: .plain, target: self, action: #selector(goBack)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.leftBarButtonItem  = button1

    }
    
    @objc func goBack(){
        print("tap close btn")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
