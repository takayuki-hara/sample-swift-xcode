//
//  ListViewController.swift
//  snapkit-sample
//
//  Created by 原隆幸 on 2018/07/11.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import UIKit
import SnapKit

class ListViewController: UITableViewController {

    let kCellIdentifier = "CellIdentifier"
    let demos = ["Simple Layout", "Basic UIScrollView"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "SnapKit iOS Demos"

        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier)! as UITableViewCell

        cell.textLabel?.text = demos[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let viewController = SimpleLayoutViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if indexPath.row == 1 {
            let viewController = BasicUIScrollViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
