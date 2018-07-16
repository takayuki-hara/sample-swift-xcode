//
//  ViewControllerSpec.swift
//  testing-sampleTests
//
//  Created by 原隆幸 on 2018/07/14.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import Quick
import Nimble
@testable import testing_sample

class ViewControllerSpec: QuickSpec {
    override func spec() {
        var subject: ViewController!

        beforeEach {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            subject = sb.instantiateViewController(
                withIdentifier: "viewControllerId") as! ViewController
            // Memo: Storyboardを使っていない場合は簡単に書ける
            //subject = ViewController()

            expect(subject.view).notTo(beNil())
            expect(subject.countLabel).notTo(beNil())
        }

        // Memo: viewDidLoadを試験する（viewDidLoadは試験ごとに呼ばれる）
        describe(".viewDidLoad()") {
            beforeEach {
                // Method #1: Access the view to trigger ViewController.viewDidLoad().
                let _ =  subject.view
            }

            it("init count") {
                expect(subject.countLabel).notTo(beNil())
                expect(subject.countLabel.text).to(equal("0"))
            }
        }

        // Memo: ライフサイクル系の試験もできる（必要なものを直接呼び出す）
        describe(".viewWillAppear()") {
            beforeEach {
                // Method #3: Directly call the lifecycle event.
                subject.viewWillAppear(false)
            }

            it("init count") {
                expect(subject.countLabel.text).to(equal("1"))
            }
        }

        // Memo: ボタンイベントの試験
        describe("the 'increment' button") {
            it("increments count label when tapped") {
                subject.incrementButton.sendActions(for: UIControlEvents.touchUpInside)
                expect(subject.countLabel.text).to(equal("1"))
            }
        }

        // Memo: 一般的な任意のテスト
        it("init count") {
            subject.count = 0
            expect(subject.countLabel.text).to(equal("0"))
        }

    }
}
