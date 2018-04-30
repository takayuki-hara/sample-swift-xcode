//
//  ChatRoom1.swift
//  networking_oss
//
//  Created by TakayukiHARA on 2017/05/06.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import Foundation
import ObjectMapper

class ChatRoom2: Mappable {
    var roomId: Int?
    var name: String?
    var type: String?
    var role: String?
    var sticky: Bool?
    var unreadNum: Int?
    var mentionNum: Int?
    var mytaskNum: Int?
    var messageNum: Int?
    var fileNum: Int?
    var taskNum: Int?
    var iconPath: String?
    var lastUpdateTime: String?

    required init?(map: Map) {
    }

    // Mappable
    func mapping(map: Map) {
        self.roomId         <- map["room_id"]
        self.name           <- map["name"]
        self.type           <- map["type"]
        self.role           <- map["role"]
        self.sticky         <- map["sticky"]
        self.unreadNum      <- map["unread_num"]
        self.mentionNum     <- map["mention_num"]
        self.mytaskNum      <- map["mytask_num"]
        self.messageNum     <- map["message_num"]
        self.fileNum        <- map["file_num"]
        self.taskNum        <- map["task_num"]
        self.iconPath       <- map["icon_path"]
        self.lastUpdateTime <- map["last_update_time"]
    }
}
