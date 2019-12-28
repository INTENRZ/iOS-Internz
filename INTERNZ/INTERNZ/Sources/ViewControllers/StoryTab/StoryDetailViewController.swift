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
    
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var followButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContents()
        
        storyTitleLabel.lineBreakMode = .byWordWrapping
        storyTitleLabel.numberOfLines = 0
        
        followButton.layer.cornerRadius = 10
        


    }
    
    func setContents(){
        storyTitleLabel.text = storyString
        writerLabel.text = writerString
    }
    
    
    // 뒤로가기
    @IBAction func goToBack(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
