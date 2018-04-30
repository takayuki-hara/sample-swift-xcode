//
//  ChatworkApiClient1.swift
//  networking_oss
//
//  Created by TakayukiHARA on 2017/04/23.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
//import SwiftyJSON

class ChatworkApiClient2 {

    // MARK: - Properties
    var cancellable: Cancellable?

    // 汎用的なエラーのインスタンスをあらかじめ生成しておく
    let networkError = Error2(code: .network, message: "Network Error.")
    let otherError = Error2(code: .other, message: "Other Error.")

    /// ChatworkAPIでデータを取得する
    func fetchChatRoomList(loaded: @escaping ([ChatRoom2]?, Error2?) -> Void) {

        cancellable = provider.request(ChatworkApi2.errorTest) { result in
            switch result {
            case .success(let response):
                print(response.request!)
                let json = try! response.mapJSON()
                print(json)
                if let error = self.parseErrorJson(json: json) {
                    loaded(nil, error)
                } else {
                    // 結果を返す
                    if let result = Mapper<ChatRoom2>().mapArray(JSONObject: json) {
                        loaded(result, nil)
                    } else {
                        loaded(nil, self.otherError)
                    }
                }
            case .failure(let error):
                print(error)
                loaded(nil, self.networkError)
            }
        }
    }

    /// ChatworkAPIでデータを取得する
    func postMessage(loaded: @escaping (Error2?) -> Void) {
        
        cancellable = provider.request(ChatworkApi2.postMessage(roomId: AppSetup.sharedInstance.chatworkRoom, body: "aaaaaaaaa")) { result in
            switch result {
            case .success(let response):
                print(response.request!)
                let json = try! response.mapJSON()
                print(json)
                if let error = self.parseErrorJson(json: json) {
                    loaded(error)
                } else {
                    loaded(nil)
                }
            case .failure(let error):
                print(error)
                loaded(self.networkError)
            }
        }
        
    }

    // APIの返却がエラーオブジェクトなら抽出して戻す
    private func parseErrorJson(json: Any) -> Error2? {
        if let result = Mapper<ChatAPIError2>().map(JSONObject: json), let error = result.errors?[0] {
            return Error2(code: .data, message: error)
        }
        return nil
    }

    func cancelRequest() {
        cancellable?.cancel()
    }
}
