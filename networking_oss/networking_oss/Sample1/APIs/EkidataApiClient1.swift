//
//  EkidataApiClient1.swift
//  networking_oss
//
//  Created by TakayukiHARA on 2017/04/23.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class EkidataApiClient1 {

    /// 都道府県APIでデータを取得する
    class func fetchPrefecture(pref: Int, loaded: @escaping (Bool, String) -> Void) {

        // 駅データAPIはJSONを含んでいるがそのままJSONとしては使えないため、responseJSONは使えない
        // なので、responseStringを使用する

        Alamofire.request(EkidataApi1.prefecuture.apiString(code: pref))
            .responseString { response in
                switch response.result {
                case .success(let value):
                    print(value)
                    loaded(true, "Success")
                case .failure(let error):
                    print(error)
                    loaded(false, "Error")
                }

        }
    }

}
