//
//  Error1.swift
//  networking_oss
//
//  Created by TakayukiHARA on 2017/05/06.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import Foundation

struct Error1 {

    enum ErrCode {
        case none, network, data, other
    }

    var code = ErrCode.none
    var message = ""

}
