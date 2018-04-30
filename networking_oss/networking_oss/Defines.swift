//
//  Defines.swift
//  networking_oss
//
//  Created by TakayukiHARA on 2017/05/07.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import Foundation

// アプリのシステム情報をシングルトンクラスで管理
final class AppSetup {

    // Singleton
    static let sharedInstance = AppSetup()
    private init() {}

    // MARK: - Properties
    var isStaging = false
    var chatworkToken = "e6b98d11c1a444184c5a5a8xxxxxxxx"
    var chatworkRoom = "11111111"
}
