//
//  CommentViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import Kingfisher

class CommentViewController: UIViewController {
    
    @IBOutlet weak var commentTableView: UITableView!
    
    var commentList:[Comment] = []
    var commentDataSet = [commentDataClass]()
    
    var storyIdx: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "댓글"
        
        let button1 = UIBarButtonItem(image: UIImage(named: "closeIc"), style: .plain, target: self, action: #selector(goBack)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.leftBarButtonItem  = button1
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        downloadCommentData()
    }
    
    @objc func goBack(){
        print("tap close btn")
        self.dismiss(animated: true, completion: nil)
    }
    
    func downloadCommentData(){
        
        print("@@@@@ start downloading comment data @@@@@")
        
        CommentService.commentShared.commentList(self.storyIdx){
            
            response in
            
            switch response{
            case .success(let data):
                print("data????", data)
                self.commentDataSet = data as! [commentDataClass]
                self.commentTableView.reloadData()
               
            case.networkFail:
                print("error") //찍어보기 확인
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            }
        }
        
    }

}

extension CommentViewController : UITableViewDelegate {
    
}

extension CommentViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentDataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentTableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
        
        let sampleComment = self.commentDataSet[indexPath.row]
        
        cell.nameLabel.text = sampleComment.nickname
        cell.commentLabel.text = sampleComment.content
        cell.dateLabel.text = sampleComment.createdDate
        
        let urlStr = sampleComment.frontImage
        let url = URL(string: urlStr)
        cell.profileImageView.kf.setImage(with: url)
        
        return cell
    }
}
