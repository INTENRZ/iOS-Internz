//
//  MessageProfileViewController.swift
//  INTERNZ
//
//  Created by 박주연 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class MessageProfileViewController:UIViewController, UITableViewDelegate{
    
    
    @IBOutlet weak var MessageProfileListTable: UITableView!
    
    var MessageProfileSampleList:[MessageUser] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setMessageProfileSampleData()
        
        MessageProfileListTable.reloadData()
        
        MessageProfileListTable.dataSource = self
        MessageProfileListTable.delegate = self
        
        
    }
    
}

extension MessageProfileViewController{
    
    func setMessageProfileSampleData(){
        
        
        let message1 = MessageUser(name: "1박정민", content: "최근 주고 받은 쪽지 내용~~~",userMessageImgName: "profileImg1")
        
        let message2 = MessageUser(name: "1박정민", content: "최근 주고 받은 쪽지 내용~~~",userMessageImgName: "profileImg1")
        
        let message3 = MessageUser(name: "1박정민", content: "최근 주고 받은 쪽지 내용~~~",userMessageImgName: "profileImg1")
        
        let message4 = MessageUser(name: "1박정민", content: "최근 주고 받은 쪽지 내용~~~",userMessageImgName: "profileImg1")
        
        let message5 = MessageUser(name: "1박정민", content: "최근 주고 받은 쪽지 내용~~~",userMessageImgName: "profileImg1")
        
        let message6 = MessageUser(name: "1박정민", content: "최근 주고 받은 쪽지 내용~~~",userMessageImgName: "profileImg1")
        
        let message7 = MessageUser(name: "1박정민", content: "최근 주고 받은 쪽지 내용~~~",userMessageImgName: "profileImg1")
        
        
        MessageProfileSampleList = [message1, message2, message3, message4, message5, message6, message7]

    }
}

extension MessageProfileViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return MessageProfileSampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MessageProfileListTable.dequeueReusableCell(withIdentifier: "MessageProfileTableViewCell")as! MessageProfileTableViewCell
        
        let MessageUser = MessageProfileSampleList[indexPath.row]
        
        cell.UserNameLabel.text = MessageUser.name
        cell.UserTextLabel.text = MessageUser.content
        cell.UserImgView.image = MessageUser.userMessageImg
        
        return cell
    }
}
