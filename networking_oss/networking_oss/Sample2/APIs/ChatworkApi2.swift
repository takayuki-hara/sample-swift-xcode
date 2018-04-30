//
//  ChatworkApi1.swift
//  networking_oss
//
//  Created by TakayukiHARA on 2017/04/23.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import Foundation
import Moya

let endpointClosure = { (target: ChatworkApi2) -> Endpoint<ChatworkApi2> in
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
    
    // HTTP Header が必要なリクエストなら付与する
    switch target {
    case .errorTest:
        return defaultEndpoint
    default:
        return defaultEndpoint.adding(newHTTPHeaderFields: ["X-ChatWorkToken": AppSetup.sharedInstance.chatworkToken])
    }
}
let provider = MoyaProvider<ChatworkApi2>(endpointClosure: endpointClosure)
let stubProvider = MoyaProvider<ChatworkApi2>(stubClosure: MoyaProvider.immediatelyStub)


enum ChatworkApi2 {
    case errorTest // エラーを試すための定義
    case me
    case myStatus
    case contacts
    case getRooms
    case createRoom(name: String, adminIds: String, memberIds: String?, readOnlyIds: String?, description: String?, iconPreset: String?)
    case getRoomInfo(roomId: String)
    case updateRoomInfo(roomId: String, name: String?, description: String?, iconPreset: String?)
    case deleteRoom(roomId: String)
    case getRoomMembers(roomId: String)
    case updateRoomMembers(roomId: String, adminIds: String, memberIds: String?, readOnlyIds: String?)
    case getMessage(roomId: String, force: Bool?)
    case postMessage(roomId: String, body: String)
    case getMessageInfo(roomId: String, messageId: String)
    // TODO: task関連、incoming_requests関連は省略
}

extension ChatworkApi2: TargetType {

    var base: String { return AppSetup.sharedInstance.isStaging ? "https://api.chatwork.com/v2" : "https://api.chatwork.com/v2" }
    var baseURL: URL { return URL(string: base)! }

    var path: String {
        switch self {
        case .errorTest:
            return "/error"
        case .me:
            return "/me"
        case .myStatus:
            return "/my/status"
        case .contacts:
            return "/contacts"
        case .getRooms,
             .createRoom:
            return "/rooms"
        case .getRoomInfo(let roomId),
             .updateRoomInfo(let roomId, _, _, _),
             .deleteRoom(let roomId):
            return "/rooms/\(roomId)"
        case .getRoomMembers(let roomId),
             .updateRoomMembers(let roomId, _, _, _):
            return "/rooms/\(roomId)/members"
        case .getMessage(let roomId, _),
             .postMessage(let roomId, _):
            return "/rooms/\(roomId)/messages"
        case .getMessageInfo(let roomId, let messageId):
            return "/rooms/\(roomId)/\(messageId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createRoom, .postMessage:
            return .post
        case .updateRoomInfo, .updateRoomMembers:
            return .put
        case .deleteRoom:
            return .delete
        default:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        // TODO: 一部しか実装してない
        switch self {
        case .errorTest:
            return ["body": "test" as AnyObject]
        case .postMessage(_, let body):
            return ["body": body as AnyObject]
        default:
            return nil
        }
    }

    var parameterEncoding: ParameterEncoding {
        // TODO: 一部しか実装してない
        switch self {
        case .errorTest:
            return URLEncoding.queryString
        case .postMessage:
            return URLEncoding.httpBody
        default:
            return URLEncoding.queryString
        
        }
    }

    var sampleData: Data {
        // TODO: ここは各種スタブデータを用意して対応するところ
        return stubbedResponse("Rooms")
    }
    
    var task: Task {
        return .request
    }
}


// MARK: - Provider support

func stubbedResponse(_ filename: String) -> Data! {
    @objc class TestClass: NSObject { }
    
    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}

func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Helpers

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
