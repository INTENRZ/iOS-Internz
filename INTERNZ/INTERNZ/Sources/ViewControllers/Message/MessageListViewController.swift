//
//  MessageListViewController.swift
//  INTERNZ
//
//  Created by 박주연 on 29/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class MessageListViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var MessageListTable: UITableView!
    
    var MessageListSampleList:[MessageList] = []

    override func viewDidLoad() {

        super.viewDidLoad()

        setMessageListSampleData()

        MessageListTable.reloadData()

        MessageListTable.dataSource = self
        MessageListTable.delegate = self
    }

}

extension MessageListViewController{

    func  setMessageListSampleData(){

        let message1 = MessageList(send: "보낸쪽지", time:"20.01.01 ㅣ 11: 16", content: "1안녕하세요. 라인 인턴에 대해 궁금한 게 있어서 쪽지 드려요. 혹시 주 디자인 업무는 어떤 거였나요?안녕하세요. 라인 인턴에 대해 궁금한 게 있어서 쪽지 드려요. 혹시 주 디자인 업무는 어떤 거였나요?")
        
        let message2 = MessageList(send: "보낸쪽지", time:"20.01.01 ㅣ 11: 16", content: "2안녕하세요. 라인 인턴에 대해 궁금한 게 있어서 쪽지 드려요. 혹시 주 디자인 업무는 어떤 거였나요?안녕하세요. 라인 인턴에 대해 궁금한 게 있어서 쪽지 드려요. 혹시 주 디자인 업무는 어떤 거였나요?")
        
        let message3 = MessageList(send: "보낸쪽지", time:"20.01.01 ㅣ 11: 16", content: "3안녕하세요. 라인 인턴에 대해 궁금한 게 있어서 쪽지 드려요. 혹시 주 디자인 업무는 어떤 거였나요?안녕하세요. 라인 인턴에 대해 궁금한 게 있어서 쪽지 드려요. 혹시 주 디자인 업무는 어떤 거였나요?")
        
        let message4 = MessageList(send: "보낸쪽지", time:"20.01.01 ㅣ 11: 16", content: "4안녕하세요. 라인 인턴에 대해 궁금한 게 있어서 쪽지 드려요. 혹시 주 디자인 업무는 어떤 거였나요?안녕하세요. 라인 인턴에 대해 궁금한 게 있어서 쪽지 드려요. 혹시 주 디자인 업무는 어떤 거였나요?")
        
        let message5 = MessageList(send: "보낸쪽지", time:"20.01.01 ㅣ 11: 16", content: "5안녕하세요. 라인 인턴에 대해 궁금한 게 있어서 쪽지 드려요. 혹시 주 디자인 업무는 어떤 거였나요?안녕하세요. 라인 인턴에 대해 궁금한 게 있어서 쪽지 드려요. 혹시 주 디자인 업무는 어떤 거였나요?")

        MessageListSampleList = [message1, message2, message3, message4, message5]

    }
}

extension MessageListViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return MessageListSampleList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = MessageListTable.dequeueReusableCell(withIdentifier: "MessageListTableViewCell")as! MessageListTableViewCell

        let MessageList = MessageListSampleList[indexPath.row]

        cell.sendLabel.text = MessageList.send
        cell.timeLabel.text = MessageList.time
        cell.messageContentLabel.text = MessageList.content
    

        return cell
    }
}


