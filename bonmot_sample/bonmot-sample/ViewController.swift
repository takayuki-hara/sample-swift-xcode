//
//  ViewController.swift
//  bonmot-sample
//
//  Created by 原隆幸 on 2018/07/18.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import UIKit
import BonMot

class ViewController: UIViewController {

    let baseStyle = StringStyle(
        .lineHeightMultiple(1.2),
        .font(UIFont.systemFont(ofSize: 17))
    )

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        sample1()
        sample2()
        sample3()
        sample4()
        sample5()
        sample6()
        sample7()
        sampleDebug()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sample1() {
        let quote = """
        I used to love correcting people’s grammar until \
        I realized what I loved more was having friends.
        -Mara Wilson
        """

        let style = StringStyle(
            .font(UIFont(name: "AmericanTypewriter", size: 17)!),
            .lineHeightMultiple(1.8)
        )

        label1.attributedText = quote.styled(with: style)
    }

    func sample2() {
        let redStyle = baseStyle.byAdding(.color(.red))
        label2.attributedText = "bird".styled(with: redStyle)
    }

    func sample3() {
        let blueStyle = baseStyle.byAdding(.color(.blue))
        label3.attributedText = "bird".styled(with: blueStyle)
    }

    func sample4() {
        let string = "one fish, two fish, <red>red fish</red>,<BON:noBreakSpace/><blue>blue fish</blue>"

        let redStyle = StringStyle(.color(.red))
        let blueStyle = StringStyle(.color(.blue))

        let fishStyle = StringStyle(
            .font(UIFont.systemFont(ofSize: 17)),
            .lineHeightMultiple(1.8),
            .color(.darkGray),
            .xmlRules([
                .style("red", redStyle),
                .style("blue", blueStyle),
                ])
        )

        label4.attributedText = string.styled(with: fishStyle)
    }

    func sample5() {
        let someImage = UIImage(named: "gameIcon")!

//        let attributedString = NSAttributedString.composed(of: [
//            someImage.styled(with: .baselineOffset(-4)), // shift vertically if needed
//            Special.noBreakSpace, // a non-breaking space between image and text
//            "label with icon", // raw or attributed string
//            ])
        let attributedString = NSAttributedString.composed(of: [
            someImage.styled(with: .baselineOffset(-4.0)), // shift vertically if needed
            Tab.headIndent(10), // horizontal space between image and text
            "This is some text that goes on and on and spans multiple lines, and it all ends up left-aligned",
            ])
        label5.attributedText = attributedString
    }

    func sample6() {
        let quote = """
        I used to love correcting people’s grammar until \
        I realized what I loved more was having friends.
        -Mara Wilson
        """

        let style = StringStyle(
            .font(UIFont(name: "AmericanTypewriter", size: 17)!),
            .lineHeightMultiple(1.8),
            .adapt(.body)
        )

        label6.attributedText = quote.styled(with: style)
    }

    func sample7() {
    }

    func sampleDebug() {
        let debug = NSAttributedString.composed(of: [
            Special.noBreakSpace,
            "Monday",
            Special.enDash,
            "Friday"
            ]).bonMotDebugString
        print(debug)
    }

}

