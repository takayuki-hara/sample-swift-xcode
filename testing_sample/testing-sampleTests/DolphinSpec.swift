//
//  DolphinSpec.swift
//  testing-sampleTests
//
//  Created by 原隆幸 on 2018/07/16.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import Quick
import Nimble
@testable import testing_sample

class DolphinSpec: QuickSpec {
    override func spec() {

        // Examples の it
        it("is friendly") {
            expect(Dolphin().isFriendly).to(beTruthy())
        }

        it("is smart") {
            expect(Dolphin().isSmart).to(beTruthy())
        }

        // Example Groups の describe と context
        describe("its click") {
            it("is loud") {
                let click = Dolphin().click()
                expect(click.isLoud).to(beTruthy())
            }

            it("has a high frequency") {
                let click = Dolphin().click()
                expect(click.hasHighFrequency).to(beTruthy())
            }
        }

        // beforeEach と afterEach を使って Setup/Teardown のコードを共有する
        describe("a dolphin") {
            var dolphin: Dolphin!
            beforeEach {
                dolphin = Dolphin()
            }

            describe("its click") {
                var click: Click!
                beforeEach {
                    click = dolphin.click()
                }

                it("is loud") {
                    expect(click.isLoud).to(beTruthy())
                }

                it("has a high frequency") {
                    expect(click.hasHighFrequency).to(beTruthy())
                }
            }
        }

        // context を使ってある条件での動作を記述する
        describe("a dolphin clicks") {
            var dolphin: Dolphin!
            beforeEach { dolphin = Dolphin() }

            describe("its click") {
                context("when the dolphin is not near anything interesting") {
                    it("is only emitted once") {
                        expect(dolphin.click().count).to(equal(1))
                    }
                }

                context("when the dolphin is near something interesting") {
                    beforeEach {
                        dolphin.discoverInterest()
                        dolphin.discoverInterest()
                    }

                    it("is emitted three times") {
                        expect(dolphin.click().count).to(equal(3))
                    }
                }
            }
        }

        // 一時的に Examples や Example Groups を無効にする
        xdescribe("its click") {
            // ...none of the code in this closure will be run.
        }

        xcontext("when the dolphin is not near anything interesting") {
            // ...none of the code in this closure will be run.
        }

        xit("is only emitted once") {
            // ...none of the code in this closure will be run.
        }

        // 指定した Examples だけ一時的に実行する
        fit("is loud") {
            // ...only this focused example will be run.
        }

        fcontext("when the dolphin is near something interesting") {
            // ...examples in this group are also focused, so they'll be run.
        }
    }
}
