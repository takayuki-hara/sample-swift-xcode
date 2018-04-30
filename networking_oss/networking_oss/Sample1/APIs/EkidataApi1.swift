//
//  EkidataApi1.swift
//  networking_oss
//
//  Created by TakayukiHARA on 2017/04/23.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import Foundation

/**
 * 【注意】レスポンスはJSONを含んだ単なる文字列のためそのままでは読み込めません！
 */

enum EkidataApi1 {
    case prefecuture, line, station, group, neighbor

    var baseUrl: String {
        return "http://www.ekidata.jp/api/"
    }
    func apiString(code: Int) -> String {
        switch self {
        case .prefecuture:  return self.baseUrl + "p/" + String(code) + ".json"
        case .line:         return self.baseUrl + "l/" + String(code) + ".json"
        case .station:      return self.baseUrl + "s/" + String(code) + ".json"
        case .group:        return self.baseUrl + "g/" + String(code) + ".json"
        case .neighbor:     return self.baseUrl + "n/" + String(code) + ".json"
        }
    }
}

/**
 * [Parameter Sample]
 *   prefecuture:23=愛知県
 *   line:11302=JR山手線
 *   station:1130224:JR山手線 東京駅
 *   group:1130224:JR山手線 東京駅
 *   neighbor:11302=JR山手線
 */
