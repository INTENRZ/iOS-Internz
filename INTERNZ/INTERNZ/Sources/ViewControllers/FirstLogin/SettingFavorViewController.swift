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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "맞춤설정"
        
        self.completeButton.layer.cornerRadius = 5
        

        
    }
    

    

}
