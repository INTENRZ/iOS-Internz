//
//  MessageProfileViewController.swift
//  INTERNZ
//
//  Created by 박주연 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import Kingfisher

class MessageProfileViewController:UIViewController, UITableViewDelegate{
    
    
    @IBOutlet weak var MessageProfileListTable: UITableView!
    
    var MessageProfileSampleList:[MessageUser] = []
    
    var messageDataSet = [letterDataClass]()
    
    
    @IBOutlet weak var closeButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = "유저쪽지"
        
        setMessageProfileSampleData()
        
//        MessageProfileListTable.reloadData()
        MessageProfileListTable.dataSource = self
        MessageProfileListTable.delegate = self
        
        var addItem: UIBarButtonItem{
            let addImage = UIImage(named: "closeIc")
            let addButton = UIButton(type: UIButton.ButtonType.custom)
            addButton.setBackgroundImage(addImage, for: UIControl.State())
            addButton.frame = CGRect(x: 0, y: 0, width: (addImage?.size.width)!, height: (addImage?.size.height)!)
            let addItem = UIBarButtonItem(customView: addButton)
            return addItem
        }
        navigationItem.leftBarButtonItems = [addItem]
        
        downloadLetterListData()
        
    }
    
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func downloadLetterListData(){
        
        LetterService.letterShared.letterPeopleList {
            
            response in
            
            switch response {
            case .success(let data) :
                print("data??", data)
                self.messageDataSet = data as! [letterDataClass]
                self.MessageProfileListTable.reloadData()
       
            case.networkFail:
                print("error")
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
 
            }
        }
    } // downloadLetterListData
    

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
    
    // table cell click event
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let MessageUser = MessageProfileSampleList[indexPath.row]
        print(MessageUser.name)
        
        let dvc = storyboard?.instantiateViewController(withIdentifier: "MessageListViewController") as! MessageListViewController
        dvc.username = MessageUser.name
        
        let navigationController = UINavigationController(rootViewController: dvc)
        
        navigationController.modalPresentationStyle = .fullScreen
        
        present(navigationController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.messageDataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MessageProfileListTable.dequeueReusableCell(withIdentifier: "MessageProfileTableViewCell")as! MessageProfileTableViewCell
        
        let MessageUser = MessageProfileSampleList[indexPath.row]
        
        let msgUser = self.messageDataSet[indexPath.row]
        
        cell.UserNameLabel.text = msgUser.nickname
        cell.UserTextLabel.text = msgUser.content
        
        let urlStr = msgUser.frontImage
        let url = URL(string: urlStr)
        cell.UserImgView.kf.setImage(with: url)
        
        
        return cell
    }
}
