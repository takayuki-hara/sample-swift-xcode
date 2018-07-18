//
//  ViewController.swift
//  keychainaccess-sample
//
//  Created by 原隆幸 on 2018/07/18.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import UIKit
import KeychainAccess

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        sample1()
        sample2()
        sample3()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sample1() {
        let keychain = Keychain(service: "com.example.github-token")
        keychain["sample1"] = "01234567-89ab-cdef-0123-456789abcde1"

        var token = try? keychain.get("sample1")
        dump(token)

        keychain["sample1"] = nil
        token = try? keychain.get("sample1")
        dump(token)
    }

    func sample2() {
        let keychain = Keychain(server: "https://github.com", protocolType: .https)
        try? keychain.set("01234567-89ab-cdef-0123-456789abcde2", key: "sample2")

        var token = try? keychain.get("sample2")
        dump(token)

        try? keychain.remove("sample2")
        token = try? keychain.get("sample2")
        dump(token)
    }

    func sample3() {
        let keychain = Keychain(server: "https://github.com", protocolType: .https)
        do {
            try keychain
                .label("github.com (sample3)")
                .comment("github access token")
                .set("01234567-89ab-cdef-0123-456789abcde3", key: "sample3")
        } catch let error {
            print("error: \(error)")
        }

        do {
            let attributes = try keychain.get("sample3") { $0 }
            print(attributes?.comment ?? "")
            print(attributes?.label ?? "")
            print(attributes?.creator ?? "")
        } catch let error {
            print("error: \(error)")
        }
    }
}

