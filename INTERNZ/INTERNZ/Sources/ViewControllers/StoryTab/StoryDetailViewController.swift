//
//  StoryDetailViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 25/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class StoryDetailViewController: UIViewController {

    var storyString: String?
    var writerString: String?
    
    @IBOutlet weak var storyTitleLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContents()

    }
    
    func setContents(){
        storyTitleLabel.text = storyString
        writerLabel.text = writerString
    }
    


}
