//
//  NENTabBarController.swift
//  NetEaseNews
//
//  Created by kingsic on 2018/10/8.
//  Copyright © 2018年 kingsic. All rights reserved.
//

import UIKit

class NENTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addChildViewController(childVC: NENHomeViewController(), title: "首页", imageName: "tabbar_icon_home")
        addChildViewController(childVC: NENVideoViewController(), title: "视频", imageName: "tabbar_icon_live")
        addChildViewController(childVC: NENTalkViewController(), title: "讲讲", imageName: "tabbar_icon_discovery")
        addChildViewController(childVC: NENProfileViewController(), title: "我的", imageName: "tabbar_icon_profile")
    }
    
    private func addChildViewController(childVC: UIViewController, title: String, imageName: String) {
        childVC.tabBarItem.title = title
        childVC.tabBarItem.image = UIImage(named: imageName)
        
        let childVCNav = UINavigationController(rootViewController: childVC)
        addChild(childVCNav)
    }

}
