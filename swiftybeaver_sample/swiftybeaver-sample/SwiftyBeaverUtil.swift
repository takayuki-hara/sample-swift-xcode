//
//  SwiftyBeaverUtil.swift
//  swiftybeaver-sample
//
//  Created by 原隆幸 on 2018/07/16.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import Foundation
import SwiftyBeaver

let log = SwiftyBeaver.self
class SwiftyBeaverUtil {

//    static let filePath = "/tmp/swiftybeaver.log"

    class func initialize() {
        // destinations
        let console = ConsoleDestination()
        let file = FileDestination()
        let cloud = SBPlatformDestination(appID: "Wxjw89",
                                      appSecret: "vc9gi2wzLFev0wG4tulg9milldtfsppi",
                                  encryptionKey: "zh5azpQpsTIznj0tqiwdggGuwtrbzczs")

//        // setup file path
//        file.logFileURL = URL(string: filePath)

        // add the destinations to SwiftyBeaver
        log.addDestination(console)
        log.addDestination(file)
        log.addDestination(cloud)
    }

    class func logfilePath() -> String {
//        return SwiftyBeaverUtil.filePath
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory,
                                                   .userDomainMask,
                                                   true).first!
    }
}
