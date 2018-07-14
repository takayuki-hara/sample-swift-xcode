//
//  WrapSample.swift
//  json-sample
//
//  Created by 原隆幸 on 2018/07/11.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import Foundation
import Wrap

// -----------------------------------------------------------------------------

struct User2 {
    let name: String
    let age: Int
}

let user = User2(name: "John", age: 28)

// -----------------------------------------------------------------------------

struct SpaceShip2 {
    let type: SpaceShipType2
    let weight: Double
    let engine: Engine2
    let passengers: [Astronaut2]
    let launchLiveStreamURL: URL?
    let lastPilot: Astronaut2?
}

enum SpaceShipType2: Int, WrappableEnum {
    case apollo
    case sputnik
}

struct Engine2 {
    let manufacturer: String
    let fuelConsumption: Float
}

struct Astronaut2 {
    let name: String
}

let ship = SpaceShip2(
    type: .apollo,
    weight: 3999.72,
    engine: Engine2(
        manufacturer: "The Space Company",
        fuelConsumption: 17.2321
    ),
    passengers: [
        Astronaut2(name: "Mike"),
        Astronaut2(name: "Amanda")
    ],
    launchLiveStreamURL: URL(string: "http://livestream.com"),
    lastPilot: nil
)

// -----------------------------------------------------------------------------

struct Book: WrapCustomizable {
    let title: String
    let authorName: String

    func keyForWrapping(propertyNamed propertyName: String) -> String? {
        if propertyName == "authorName" {
            return "author_name"
        }

        return propertyName
    }
}

let book = Book(title: "title", authorName: "author")

// -----------------------------------------------------------------------------

class WrapSample {
    class func test() {
        let userDic: [String : Any]? = try? wrap(user)
        print(userDic ?? "error")

        let shipDic: WrappedDictionary? = try? wrap(ship)
        print(shipDic ?? "error")

        let bookDic: WrappedDictionary? = try? wrap(book)
        print(bookDic ?? "error")
    }
}
