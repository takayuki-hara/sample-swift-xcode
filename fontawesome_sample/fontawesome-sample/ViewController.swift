//
//  ViewController.swift
//  fontawesome-sample
//
//  Created by 原隆幸 on 2018/07/18.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import UIKit
import FontAwesomeKit

class ViewController: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        sample()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sample() {
        // アイコン作成時のサイズ＜イメージのサイズ　→　小さくなる（余白ができる）
        // アイコン作成時のサイズ＞イメージのサイズ　→　はみ出る（見切れる）
        // なので、アイコン作成時のサイズは

        // アイコン作成
        let starIcon = FAKFontAwesome.starIcon(withSize: 50)
        let bookmarkIcon = FAKFoundationIcons.bookmarkIcon(withSize: 50)
        let twitterIcon = FAKZocial.twitterIcon(withSize: 50)
        let emailIcon = FAKIonIcons.iosEmailIcon(withSize: 50)
        let androidIcon = FAKMaterialIcons.androidIcon(withSize: 50)
        // これはなぜか実行時に落ちる
        //let repoIcon = FAKOcticons.repoIcon(withSize: 48)

        // 設定
        starIcon?.drawingBackgroundColor = UIColor.yellow

        // 画像化
        image1.image = starIcon?.image(with: image1.frame.size)
        image2.image = bookmarkIcon?.image(with: image2.frame.size)
        image3.image = twitterIcon?.image(with: image3.frame.size)
        image4.image = emailIcon?.image(with: image4.frame.size)
        image5.image = androidIcon?.image(with: image5.frame.size)

        image1.layer.masksToBounds = true
        image1.layer.cornerRadius = 10
    }
}

