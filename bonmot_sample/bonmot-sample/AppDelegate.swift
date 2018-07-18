//
//  AppDelegate.swift
//  bonmot-sample
//
//  Created by 原隆幸 on 2018/07/18.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import UIKit
import BonMot

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // for sample7()
        let style = StringStyle(
            .font(UIFont(name: "Avenir-Roman", size: 24)!),
            .color(.red),
            .underline(.styleSingle, .red)
        )
        NamedStyles.shared.registerStyle(forName: "MyHeadline", style: style)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

