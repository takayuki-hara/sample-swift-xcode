//
//  ViewController.swift
//  networking_oss
//
//  Created by TakayukiHARA on 2017/04/22.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //self.sampleSample1()
        self.sampleSample2()
        //self.sampleSwagger()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func sampleSample1() {
        // API Test
        ChatworkApi1Test()

        // Chatwork
        let cwClient1 = ChatworkApiClient1()
        cwClient1.fetchChatRoomList { ret, error in
            print("cwClient1-fetchChatRoomList:")
            guard let rooms = ret else {
                print(error?.message ?? "no message")
                return
            }
            for room in rooms {
                print("roomId=\(room.roomId), name=\(room.name)")
            }
        }

        // Ekidata
        EkidataApiClient1.fetchPrefecture(pref: 23) { ret, retString in
            print("ekiClient1-fetchPrefecture:" + "\(ret), \(retString)")
        }
    }

    private func sampleSample2() {
        let cwClient2 = ChatworkApiClient2()
        cwClient2.fetchChatRoomList { ret, error in
            print("cwClient2-fetchChatRoomList:")
            guard let rooms = ret else {
                print(error?.message ?? "no message")
                return
            }
            for room in rooms {
                print("roomId=\(String(describing: room.roomId)), name=\(String(describing: room.name))")
            }
        }
    }

    private func sampleSwagger() {
        // Get
        StoreAPI.getInventory { ret, _ in
            guard let array = ret else { return }
            print("StoreAPI-getInventory: Success")
            for dic in array {
                print("\(dic.key):\(dic.value)")
            }
        }

        PetAPI.findPetsByStatus(status: ["sold"]) { pets, _ in
            guard let pets = pets else { return }
            for pet in pets {
                print("id:\(pet.id!)")
                print("name:\(pet.name!)")
            }
        }

        // Post
        let pet = Pet()
        pet.id = 999
        pet.name = "hoge"
        pet.photoUrls = ["https://"]
        PetAPI.updatePet(body: pet) { error in
            if let error = error {
                print(error)
            }
        }
    }

}
