//
//  ChatworkApiClient1.swift
//  networking_oss
//
//  Created by TakayukiHARA on 2017/04/23.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ChatworkApiClient1 {

    // 汎用的なエラーのインスタンスをあらかじめ生成しておく
    let networkError = Error1(code: .network, message: "Network Error.")
    let otherError = Error1(code: .other, message: "Other Error.")

    /// ChatworkAPIでデータを取得する
    func fetchChatRoomList(loaded: @escaping ([ChatRoom1]?, Error1?) -> Void) {

        //let api = ChatworkApi.error
        let api = ChatworkApi1.rooms.root(roomId: nil)
        Alamofire.request(api.apiString(), headers: api.headers(token: AppSetup.sharedInstance.chatworkToken))
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print(json)

                    if let error = self.parseErrorJson(json: json) {
                        loaded(nil, error)
                    } else {
                        // 結果を返す
                        loaded(self.parseRoomFromJson(json: json), nil)
                    }
                case .failure(let error):
                    print(error)
                    loaded(nil, self.networkError)
                }
        }
    }

    // APIの返却がエラーオブジェクトなら抽出して戻す
    private func parseErrorJson(json: JSON) -> Error1? {
        if let error = json["errors"].array {
            return Error1(code: .data, message: error[0].string!)
        }
        return nil
    }

    // ルーム一覧を抽出する
    private func parseRoomFromJson(json: JSON) -> [ChatRoom1]? {
        var rooms: [ChatRoom1] = []

        for i in 0..<json.count {
            var obj = ChatRoom1()
            obj.roomId = json[i]["room_id"].intValue
            obj.name = json[i]["name"].stringValue
            obj.type = json[i]["type"].stringValue
            obj.role = json[i]["role"].stringValue
            obj.sticky = json[i]["sticky"].boolValue
            obj.unreadNum = json[i]["unreadNum"].intValue
            obj.mentionNum = json[i]["mentionNum"].intValue
            obj.mytaskNum = json[i]["mytaskNum"].intValue
            obj.messageNum = json[i]["messageNum"].intValue
            obj.fileNum = json[i]["fileNum"].intValue
            obj.taskNum = json[i]["taskNum"].intValue
            obj.iconPath = json[i]["iconPath"].stringValue
            obj.lastUpdateTime = json[i]["lastUpdateTime"].stringValue

            rooms.append(obj)
        }

        if rooms.count == 0 {
            return nil
        }
        return rooms
    }

}
