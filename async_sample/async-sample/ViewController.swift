//
//  ViewController.swift
//  async-sample
//
//  Created by 原隆幸 on 2018/07/18.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import UIKit
import Async

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        sample1()
        sample2()
        sample3()
        sample4()
        sample5()
        sleep(1)
        sample6()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sample1() {
        // Async syntactic sugar
        Async.background {
            print("[sample1] A: This is run on the \(qos_class_self().description) (expected \(QOS_CLASS_BACKGROUND.description))")
            }.main {
                print("[sample1] B: This is run on the \(qos_class_self().description) (expected \(qos_class_main().description)), after the previous block")
        }

        // Regular GCD
        // Swift4
        DispatchQueue.global(qos: .default).async {
            print("[sample1] REGULAR GCD: This is run on the background queue")
            DispatchQueue.main.async {
                print("[sample1] REGULAR GCD: This is run on the main queue")
            }
        }
        // Old Swift version
        /*
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            print("REGULAR GCD: This is run on the background queue")
            dispatch_async(dispatch_get_main_queue(), 0), {
                print("REGULAR GCD: This is run on the main queue")
            })
        })
         */
    }

    func sample2() {
        // Chaining with Async
        var id = 0
        Async.main {
            id += 1
            print("[sample2] This is run on the \(qos_class_self().description) (expected \(qos_class_main().description)) count: \(id) (expected 1) ")
            // Prints: "This is run on the Main (expected Main) count: 1 (expected 1)"
            }.userInteractive {
                id += 1
                print("[sample2] This is run on the \(qos_class_self().description) (expected \(QOS_CLASS_USER_INTERACTIVE.description)) count: \(id) (expected 2) ")
                // Prints: "This is run on the Main (expected Main) count: 2 (expected 2)"
            }.userInitiated {
                id += 1
                print("[sample2] This is run on the \(qos_class_self().description) (expected \(QOS_CLASS_USER_INITIATED.description)) count: \(id) (expected 3) ")
                // Prints: "This is run on the User Initiated (expected User Initiated) count: 3 (expected 3)"
            }.utility {
                id += 1
                print("[sample2] This is run on the \(qos_class_self().description) (expected \(QOS_CLASS_UTILITY.description)) count: \(id) (expected 4) ")
                // Prints: "This is run on the Utility (expected Utility) count: 4 (expected 4)"
            }.background {
                id += 1
                print("[sample2] This is run on the \(qos_class_self().description) (expected \(QOS_CLASS_BACKGROUND.description)) count: \(id) (expected 5) ")
                // Prints: "This is run on the User Interactive (expected User Interactive) count: 5 (expected 5)"
        }
    }

    func sample3() {
        // Keep reference for block for later chaining
        let backgroundBlock = Async.background {
            print("[sample3] This is run on the \(qos_class_self().description) (expected \(QOS_CLASS_BACKGROUND.description))")
        }
        // Run other code here...
        backgroundBlock.main {
            print("[sample3] This is run on the \(qos_class_self().description) (expected \(qos_class_main().description)), after the previous block")
        }
    }

    func sample4() {
        // Custom queues
        let customQueue = DispatchQueue(label: "CustomQueueLabel", attributes: [.concurrent])
        let otherCustomQueue = DispatchQueue(label: "OtherCustomQueueLabel")
        Async.custom(queue: customQueue) {
            print("[sample4] Custom queue")
            }.custom(queue: otherCustomQueue) {
                print("[sample4] Other custom queue")
        }

    }

    func sample5() {
        // After
        let seconds = 0.5
        Async.main(after: seconds) {
            print("[sample5] Is called after 0.5 seconds")
            }.background(after: 0.4) {
                print("[sample5] At least 0.4 seconds after previous block, and 0.9 after Async code is called")
        }
    }

    func sample6() {
        // Cancel blocks not yet dispatched
        let block1 = Async.background {
            // Heavy work
            for i in 0...1000 {
                print("[sample6] A \(i)")
            }
        }
        let block2 = block1.background {
            print("[sample6] B – shouldn't be reached, since cancelled")
        }
        Async.main {
            block1.cancel() // First block is _not_ cancelled
            block2.cancel() // Second block _is_ cancelled
        }
    }
}

