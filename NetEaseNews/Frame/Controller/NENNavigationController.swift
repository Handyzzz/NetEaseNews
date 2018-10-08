//
//  NENNavigationController.swift
//  NetEaseNews
//
//  Created by kingsic on 2018/10/8.
//  Copyright © 2018年 kingsic. All rights reserved.
//

import UIKit

class NENNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        interactivePopGestureRecognizer?.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            let backBtn = UIButton(type: .custom)
            backBtn.setImage(UIImage(named: "nav_item_back_black_25x25_"), for: .normal)
            backBtn.sizeToFit()
            backBtn.addTarget(self, action: #selector(backBtn_action), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)

            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    @objc private func backBtn_action() {
        popViewController(animated: true)
    }
}

extension NENNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return children.count > 1
    }
}
