//
//  UnboxSample.swift
//  json-sample
//
//  Created by 原隆幸 on 2018/07/11.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import Foundation
import Unbox

// -----------------------------------------------------------------------------

let userDic: [String : Any] = ["name": "John", "age": 27]

struct User {
    let name: String
    let age: Int
}

extension User: Unboxable {
    init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.age = try unboxer.unbox(key: "age")
    }
}

// -----------------------------------------------------------------------------

let spaceJson = """
    {
        "type": 0,
        "weight": 62.123,
        "engine": {
            "manufacturer": "man",
            "fuelConsumption": 12.34
        },
        "passengers": [
            {
                "name": "taro"
            }
        ],
        "liveStreamURL": "https://www.google.com",
        "lastPilot": {
            "name": "jiro"
        },
        "lastLaunchDate": "2018-07-14"
    }
"""

struct SpaceShip {
    let type: SpaceShipType
    let weight: Double
    let engine: Engine
    let passengers: [Astronaut]
    let launchLiveStreamURL: URL?
    let lastPilot: Astronaut?
    let lastLaunchDate: Date?
}

extension SpaceShip: Unboxable {
    init(unboxer: Unboxer) throws {
        self.type = try unboxer.unbox(key: "type")
        self.weight = try unboxer.unbox(key: "weight")
        self.engine = try unboxer.unbox(key: "engine")
        self.passengers = try unboxer.unbox(key: "passengers")
        self.launchLiveStreamURL = unboxer.unbox(key: "liveStreamURL")
        self.lastPilot = unboxer.unbox(key: "lastPilot")

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        self.lastLaunchDate = unboxer.unbox(key: "lastLaunchDate", formatter: dateFormatter)
    }
}

enum SpaceShipType: Int, UnboxableEnum {
    case apollo
    case sputnik
}

struct Engine {
    let manufacturer: String
    let fuelConsumption: Float
}

extension Engine: Unboxable {
    init(unboxer: Unboxer) throws {
        self.manufacturer = try unboxer.unbox(key: "manufacturer")
        self.fuelConsumption = try unboxer.unbox(key: "fuelConsumption")
    }
}

struct Astronaut {
    let name: String
}

extension Astronaut: Unboxable {
    init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
    }
}

// -----------------------------------------------------------------------------

let uuidDic: [String : Any] = ["uuid": "E621E1F8-C36C-495A-93FC-0C247A3E6E5F"]

struct Uuid {
    let uuid: UniqueIdentifier
}

extension Uuid: Unboxable {
    init(unboxer: Unboxer) throws {
        self.uuid = try unboxer.unbox(key: "uuid")
    }
}

struct UniqueIdentifier: UnboxableByTransform {
    typealias UnboxRawValue = String

    let identifierString: String

    init?(identifierString: String) {
        if let UUID = NSUUID(uuidString: identifierString) {
            self.identifierString = UUID.uuidString
        } else {
            return nil
        }
    }

    static func transform(unboxedValue: String) -> UniqueIdentifier? {
        return UniqueIdentifier(identifierString: unboxedValue)
    }
}

// -----------------------------------------------------------------------------

let runnerJson = """
{
    "name": "John",
    "age": 27,
    "activities": {
        "running": {
            "distance": 300
        }
    },
    "devices": [
        "Macbook Pro",
        "iPhone",
        "iPad"
    ]
}
"""

struct Runner {
    let name: String
    let age: Int
    let runningDistance: Int
    let primaryDeviceName: String
}

extension Runner: Unboxable {
    init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.age = try unboxer.unbox(key: "age")
        self.runningDistance = try unboxer.unbox(keyPath: "activities.running.distance")
        self.primaryDeviceName = try unboxer.unbox(keyPath: "devices.0")
    }
}

// -----------------------------------------------------------------------------

class UnboxSample {
    class func test() {
        let user: User? = try? unbox(dictionary: userDic)
        dump(user)

        let data1 = spaceJson.data(using: .utf8)!
        do {
            let dic = try JSONSerialization.jsonObject(with: data1, options: []) as? [String: Any]
            let space: SpaceShip = try unbox(dictionary: dic!)
            dump(space)
        } catch {
            print(error.localizedDescription)
        }

        let uuid: Uuid? = try? unbox(dictionary: uuidDic)
        dump(uuid)

        let data2 = runnerJson.data(using: .utf8)!
        do {
            let dic = try JSONSerialization.jsonObject(with: data2, options: []) as? [String: Any]
            let runner: Runner? = try? unbox(dictionary: dic!)
            dump(runner)
        } catch {
            print(error.localizedDescription)
        }

    }
}
