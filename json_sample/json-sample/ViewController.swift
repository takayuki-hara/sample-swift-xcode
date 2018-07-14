//
//  ViewController.swift
//  json-sample
//
//  Created by 原隆幸 on 2018/07/11.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        UnboxSample.test()
        WrapSample.test()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

