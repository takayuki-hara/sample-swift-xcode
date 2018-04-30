//
//  Error1.swift
//  networking_oss
//
//  Created by TakayukiHARA on 2017/05/06.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import Foundation
import ObjectMapper

class ChatAPIError2: Mappable {
    var errors: [String]?
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        self.errors <- map["errors"]
    }
}

struct Error2 {

    enum ErrCode {
        case none, network, data, other
    }

    var code = ErrCode.none
    var message = ""

}
