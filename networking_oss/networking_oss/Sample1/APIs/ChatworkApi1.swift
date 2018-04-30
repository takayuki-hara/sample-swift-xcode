//
//  ChatworkApi1.swift
//  networking_oss
//
//  Created by TakayukiHARA on 2017/04/23.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import Foundation

enum ChatworkApi1 {

    case me
    enum my {
        case status, tasks

        func apiString() -> String {
            switch self {
            case .status: return baseUrl + "status"
            case .tasks:  return baseUrl + "tasks"
            }
        }
        func headers(token: String) -> [String: String] {
            return ["X-ChatWorkToken": token]
        }
    }
    case contacts
    enum rooms {
        case root(roomId: String?)
        case members(roomId: String)
        case messages(roomId: String, messageId: String?)
        case tasks(roomId: String, taskId: String?)
        case files(roomId: String, fileId: String?)

        func apiString() -> String {
            switch self {
            case let .root(roomId):
                return baseUrl + "rooms" + parameterString(roomId)
            case let .members(roomId):
                return baseUrl + "members" + "/\(roomId)"
            case let .messages(roomId, messageId):
                return baseUrl + "messages" + "/\(roomId)" + parameterString(messageId)
            case let .tasks(roomId, taskId):
                return baseUrl + "tasks" + "/\(roomId)" + parameterString(taskId)
            case let .files(roomId, fileId):
                return baseUrl + "files" + "/\(roomId)" + parameterString(fileId)
            }
        }
        func headers(token: String) -> [String: String] {
            return ["X-ChatWorkToken": token]
        }
    }
    enum incoming_requests {
        case root(requestId: String?)

        func apiString() -> String {
            switch self {
            case let .root(requestId):
                return baseUrl + "incoming_requests" + parameterString(requestId)
            }
        }
        func headers(token: String) -> [String: String] {
            return ["X-ChatWorkToken": token]
        }
    }
    case error  // エラーケースの確認用

    // MARK: - Public Methods
    func apiString() -> String {
        if self == .me {
            return baseUrl + "me"
        } else if self == .contacts {
            return baseUrl + "contacts"
        } else if self == .error {
            return baseUrl + "error"    // このリクエストは失敗する
        } else {
            return ""
        }
    }

    func headers(token: String) -> [String: String] {
        return ["X-ChatWorkToken": token]
    }

}

fileprivate let baseUrl = "https://api.chatwork.com/v2/"
fileprivate func parameterString(_ str: String?) -> String {
    if let validStr = str {
        return "/" + validStr
    }
    return ""
}


// MARK; - Test


/// ChatworkAPIのテストコード
func ChatworkApi1Test() {
    print(ChatworkApi1.me.headers(token: AppSetup.sharedInstance.chatworkToken))
    
    print(ChatworkApi1.me.apiString())
    print(ChatworkApi1.my.status.apiString())
    print(ChatworkApi1.contacts.apiString())
    print(ChatworkApi1.rooms.root(roomId: nil).apiString())
    print(ChatworkApi1.rooms.root(roomId: AppSetup.sharedInstance.chatworkRoom).apiString())
    print(ChatworkApi1.rooms.members(roomId: AppSetup.sharedInstance.chatworkRoom).apiString())
    print(ChatworkApi1.rooms.messages(roomId: AppSetup.sharedInstance.chatworkRoom, messageId: nil).apiString())
    print(ChatworkApi1.rooms.messages(roomId: AppSetup.sharedInstance.chatworkRoom, messageId: "1234").apiString())
    print(ChatworkApi1.rooms.tasks(roomId: AppSetup.sharedInstance.chatworkRoom, taskId: nil).apiString())
    print(ChatworkApi1.rooms.tasks(roomId: AppSetup.sharedInstance.chatworkRoom, taskId: "5678").apiString())
    print(ChatworkApi1.rooms.files(roomId: AppSetup.sharedInstance.chatworkRoom, fileId: nil).apiString())
    print(ChatworkApi1.rooms.files(roomId: AppSetup.sharedInstance.chatworkRoom, fileId: "9999").apiString())
    print(ChatworkApi1.incoming_requests.root(requestId: nil).apiString())
    print(ChatworkApi1.incoming_requests.root(requestId: "0000").apiString())
    
}
