//
//  CommentViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    
    @IBOutlet weak var commentTableView: UITableView!
    
    var commentList:[Comment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "댓글"
        
        let button1 = UIBarButtonItem(image: UIImage(named: "closeIc"), style: .plain, target: self, action: #selector(goBack)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.leftBarButtonItem  = button1
        
        setCommentData()
        
        commentTableView.delegate = self
        commentTableView.dataSource = self

    }
    
    @objc func goBack(){
        print("tap close btn")
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension CommentViewController {
    func setCommentData(){
        let comment1 = Comment(username: "김김김", comment: "댓글 내용 어쩌고고고고고", commentDate: "19-03-03", profileImgName: "profileImg1")
        let comment2 = Comment(username: "김김김2", comment: "댓글 내용 어쩌고고고고고", commentDate: "19-03-03", profileImgName: "profileImg1")
        let comment3 = Comment(username: "김김김3", comment: "댓글 내용 어쩌고고고고고", commentDate: "19-03-03", profileImgName: "profileImg1")
        let comment4 = Comment(username: "김김김4", comment: "댓글 내용 어쩌고고고고고", commentDate: "19-03-03", profileImgName: "profileImg1")
        let comment5 = Comment(username: "김김김5", comment: "댓글 내용 어쩌고고고고고", commentDate: "19-03-03", profileImgName: "profileImg1")
        
        commentList = [comment1, comment2, comment3, comment4, comment5]
        
    }
}


extension CommentViewController : UITableViewDelegate {
    
}

extension CommentViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentTableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
        
        let comment = commentList[indexPath.row]
        
        cell.profileImageView.image = comment.profileImg
        cell.nameLabel.text = comment.username
//        cell.dateLabel.text = comment.commentDate
//        cell.commentLabel.text = comment.comment
        
        cell.dateLabel.text = "날짜날짜"
        cell.commentLabel.text = "댓글내용"
        
        return cell
    }
}
