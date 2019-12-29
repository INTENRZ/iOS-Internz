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
    
    
    @IBOutlet weak var scrapButton: UIButton!
    
    var isScrap:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContents()
        
        storyTitleLabel.lineBreakMode = .byWordWrapping
        storyTitleLabel.numberOfLines = 0
        
        followButton.layer.cornerRadius = 10
        
        
        
    }
    
    
    @IBAction func doScrap(_ sender: UIButton) {
        
        if isScrap == false {
            self.scrapButton.setImage(UIImage(named: "scrapFillIc"), for: .normal)
            isScrap = true
        } else {
            self.scrapButton.setImage(UIImage(named: "scrapIc"), for: .normal)
            isScrap = false
        }

    }
    
    func setContents(){
        storyTitleLabel.text = storyString
        writerLabel.text = writerString
    }
    
    
    // 뒤로가기
    @IBAction func goToBack(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func goToComment(_ sender: UIButton) {
        
        print("tab comment btn")
        
        //        CommentViewController
        
//        let dvc = storyboard?.instantiateViewController(identifier: "CommentViewController") as! CommentViewController
        
        let dvc = storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        
        dvc.modalPresentationStyle = .fullScreen
//
        self.present(dvc, animated: true, completion: nil)
//
//        navigationController?.pushViewController(dvc, animated: true)
        
    }
    
    
    
}
