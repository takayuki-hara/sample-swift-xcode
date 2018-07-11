//
//  AppDelegate.swift
//  snapkit-sample
//
//  Created by 原隆幸 on 2018/07/11.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let listViewController: ListViewController = ListViewController()
        let navigationController: UINavigationController = UINavigationController(rootViewController: listViewController)

        self.window!.rootViewController = navigationController

        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()

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

