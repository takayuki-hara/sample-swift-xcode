//
//  ViewController.swift
//  swiftybeaver-sample
//
//  Created by 原隆幸 on 2018/07/16.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import UIKit
import SwiftyBeaver

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        sample()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sample() {
        // Now let’s log!
        log.verbose("not so important")  // prio 1, VERBOSE in silver
        log.debug("something to debug")  // prio 2, DEBUG in green
        log.info("a nice information")   // prio 3, INFO in blue
        log.warning("oh no, that won’t be good")  // prio 4, WARNING in yellow
        log.error("ouch, an error did occur!")  // prio 5, ERROR in red

        // log anything!
        log.verbose(123)
        log.info(-123.45678)
        log.warning(Date())
        log.error(["I", "like", "logs!"])
        log.error(["name": "Mr Beaver", "address": "7 Beaver Lodge"])

        // ログファイルの保存先
        log.verbose(SwiftyBeaverUtil.logfilePath())
    }

}

