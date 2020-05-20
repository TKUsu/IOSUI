//
//  Messages.swift
//  IOSCustomTable
//
//  Created by sujustin on 2017/5/2.
//  Copyright © 2017年 sujustin. All rights reserved.
//

import Foundation

class Message {
    var index: Int
    var userName: String
    var message: String
    var messageTime: String
    
    init(index: Int, userName: String, message: String, messageTime: String) {
        self.index = index
        self.userName = userName
        self.message = message
        self.messageTime = messageTime
    }
}
