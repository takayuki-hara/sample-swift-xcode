//
//  Dolphin.swift
//  testing-sample
//
//  Created by 原隆幸 on 2018/07/16.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import Foundation

class Dolphin {

    let isFriendly = true
    let isSmart = true
    private let clickObj = Click()

    func click() -> Click {
        return clickObj
    }

    func discoverInterest() {
        clickObj.count += 1
    }

}

class Click {

    let isLoud = true
    let hasHighFrequency = true
    var count = 1

}
