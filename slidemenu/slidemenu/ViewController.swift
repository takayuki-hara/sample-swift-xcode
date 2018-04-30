//
//  ViewController.swift
//  slidemenu
//
//  Created by TakayukiHARA on 2017/06/18.
//  Copyright © 2017年 takayuki.hara. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView: WKWebView?

    deinit {
        print("ViewController deinit")
        self.webView?.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    override func loadView() {
        self.webView = WKWebView()
        self.view = self.webView!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController viewDidLoad")

        setup()

        let requestURL = NSURL(string: "http://www.apple.com")
        let req = URLRequest(url: requestURL! as URL)
        self.webView!.load(req)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            if let progress = webView?.estimatedProgress {
                print("Progress:\(progress)")
            }
        }
    }

    func setup() {
        self.webView?.addObserver(self, forKeyPath:"estimatedProgress", options:.new, context:nil)
    }
}

