//
//  ViewController.swift
//  rncryptor-sample
//
//  Created by 原隆幸 on 2018/07/16.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import UIKit
import RNCryptor

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        sample1()
        sample2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sample1() {
        let org = "test data"
        let data = org.data(using: .utf8)!

        // Encryption
        let password = "Secret password"
        let ciphertext = RNCryptor.encrypt(data: data, withPassword: password)

        // Decryption
        do {
            let originalData = try RNCryptor.decrypt(data: ciphertext, withPassword: password)
            print(String(data: originalData, encoding: .utf8) ?? "error")
        } catch {
            print(error)
        }
    }

    func sample2() {
        let org = "[test data]"
        let data = org.data(using: .utf8)!

        //
        // Encryption
        //
        let password = "Secret password"
        let encryptor = RNCryptor.Encryptor(password: password)
        let ciphertext = NSMutableData()

        // ... Each time data comes in, update the encryptor and accumulate some ciphertext ...
        ciphertext.append(encryptor.update(withData: data))
        ciphertext.append(encryptor.update(withData: data))

        // ... When data is done, finish up ...
        ciphertext.append(encryptor.finalData())

        //
        // Decryption
        //
        let decryptor = RNCryptor.Decryptor(password: password)
        let plaintext = NSMutableData()

        // ... Each time data comes in, update the decryptor and accumulate some plaintext ...
        do {
            try plaintext.append(decryptor.update(withData: ciphertext as Data))
        } catch {
            print(error)
        }

        // ... When data is done, finish up ...
        do {
            try plaintext.append(decryptor.finalData())
            print(String(data: plaintext as Data, encoding: .utf8) ?? "error")
        } catch {
            print(error)
        }
    }
}

