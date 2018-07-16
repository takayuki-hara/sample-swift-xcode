//
//  ViewController.swift
//  testing-sample
//
//  Created by 原隆幸 on 2018/07/14.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var incrementButton: UIButton!

    @IBAction func didPushIncrementButton(_ sender: Any) {
        count += 1
    }

    var count = 0 {
        didSet {
            countLabel.text = String(count)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        count = 0
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        count = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

