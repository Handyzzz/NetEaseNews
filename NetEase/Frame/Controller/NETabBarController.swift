//
//  NETabBarController.swift
//  NetEase
//
//  Created by kingsic on 2018/10/7.
//  Copyright © 2018年 kingsic. All rights reserved.
//

import UIKit

class NETabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addChildViewController(childVC: NEHomeViewController(), title: "首页", imageName: "tabbar_icon_home")
        addChildViewController(childVC: NEVideoViewController(), title: "视频", imageName: "tabbar_icon_live")
        addChildViewController(childVC: NETalkViewController(), title: "讲讲", imageName: "tabbar_icon_discovery")
        addChildViewController(childVC: NEProfileViewController(), title: "我的", imageName: "tabbar_icon_profile")
    }
    
    private func addChildViewController(childVC: UIViewController, title: String, imageName: String) {
        childVC.title = title
        childVC.tabBarItem.image = UIImage(named: imageName)
//        childVC.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")

        let childNav = UINavigationController(rootViewController: childVC)
        addChild(childNav)
    }

}
