//
//  NENHomeViewController.swift
//  NetEaseNews
//
//  Created by kingsic on 2018/10/8.
//  Copyright © 2018年 kingsic. All rights reserved.
//

import UIKit

class NENHomeViewController: UIViewController {
    private var pageTitleView: SGPageTitleView? = nil
    private var pageContentScrollView: SGPageContentScrollView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        // 设置导航栏
        setupNavigationBar()
        
        // 添加 SGPagingView
        setupSGPagingView()
    }
}

// MARK: - - 设置导航栏
extension NENHomeViewController {
    private func setupNavigationBar() {
        // 设置导航栏背景图
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_image_red_375x64_"), for: .default)
        // 状态栏字体为白色，状态栏和导航栏背景为黑色
        navigationController?.navigationBar.barStyle = .black
        
        // 设置 leftBarButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(target: self, acrion: #selector(leftBarButtonItem_action), imageName: "navigation_logo_48x23_")
        // 设置 rightBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(target: self, acrion: #selector(rightBarButtonItem_action), imageName: "nav_live_room_image_32x22_")
    }
    
    @objc private func leftBarButtonItem_action() {
        print("leftBarButtonItem_action")
    }
    @objc private func rightBarButtonItem_action() {
        print("rightBarButtonItem_action")
    }
}

// MARK: - - 设置 SGPagingView
extension NENHomeViewController {
    private func setupSGPagingView() {
        let pageTitleViewY: CGFloat = 0.0
        
        let titles = ["关注", "头条", "视频", "娱乐"]
        let configure = SGPageTitleViewConfigure()
        configure.showIndicator = false
        configure.showBottomSeparator = false
        configure.titleColor = UIColor.gray
        configure.titleSelectedColor = UIColor.black
        configure.titleGradientEffect = true
        
        self.pageTitleView = SGPageTitleView(frame: CGRect(x: 0, y: pageTitleViewY, width: view.frame.size.width, height: 44), delegate: self, titleNames: titles, configure: configure)
        pageTitleView?.index = 1
        view.addSubview(pageTitleView!)
        
        let oneVC = UIViewController()
        oneVC.view.backgroundColor = UIColor.green
        let twoVC = UIViewController()
        twoVC.view.backgroundColor = UIColor.yellow
        let threeVC = UIViewController()
        threeVC.view.backgroundColor = UIColor.orange
        let fourVC = UIViewController()
        fourVC.view.backgroundColor = UIColor.red
        let childVCs = [oneVC, twoVC, threeVC, fourVC]
        
        let contentViewHeight = view.frame.size.height - self.pageTitleView!.frame.maxY
        let contentRect = CGRect(x: 0, y: (pageTitleView?.frame.maxY)!, width: view.frame.size.width, height: contentViewHeight)
        self.pageContentScrollView = SGPageContentScrollView(frame: contentRect, parentVC: self, childVCs: childVCs)
        pageContentScrollView?.delegateScrollView = self
        view.addSubview(pageContentScrollView!)
    }
}
// MARK: - - 设置 SGPagingView 代理方法
extension NENHomeViewController: SGPageTitleViewDelegate, SGPageContentScrollViewDelegate {
    func pageTitleView(pageTitleView: SGPageTitleView, index: Int) {
        pageContentScrollView?.setPageContentScrollView(index: index)
    }
    
    func pageContentScrollView(pageContentScrollView: SGPageContentScrollView, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        pageTitleView?.setPageTitleView(progress: progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}
