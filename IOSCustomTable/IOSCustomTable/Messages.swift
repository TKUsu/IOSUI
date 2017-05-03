//
//  Messages.swift
//  IOSCustomTable
//
//  Created by sujustin on 2017/5/2.
//  Copyright © 2017年 sujustin. All rights reserved.
//

import Foundation

class Messages {
    var userName: String?
    var messages: String?
    var messagesTime: String?
    
    init() {  }
    
    init(userName: String, messages: String, messagesTime: String) {
        self.userName = userName
        self.messages = messages
        self.messagesTime = messagesTime
    }
}
