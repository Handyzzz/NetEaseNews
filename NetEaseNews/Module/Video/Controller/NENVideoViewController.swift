//
//  NENVideoViewController.swift
//  NetEaseNews
//
//  Created by kingsic on 2018/10/8.
//  Copyright © 2018年 kingsic. All rights reserved.
//

import UIKit

class NENVideoViewController: UIViewController {
    private var pageTitleView: SGPageTitleView? = nil
    private var pageContentScrollView: SGPageContentScrollView? = nil
    
    private lazy var navigationBarView: NENVideoNavigationBarView = {
        let navigationBarView = NENVideoNavigationBarView()
        navigationBarView.delegate = self
        return navigationBarView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
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
extension NENVideoViewController {
    private func setupNavigationBar() {
        navigationController!.view.insertSubview(navigationBarView, belowSubview: navigationController?.navigationBar ?? navigationBarView)
    }
}

// MARK: - - 设置 SGPagingView
extension NENVideoViewController {
    private func setupSGPagingView() {
        let titles = ["推荐", "小视频", "榜单", "超级IP季", "播单", "搞笑", "影视", "综艺", "音乐", "现场", "黑科技", "小品", "萌物", "w军武", "猎奇", "二次元", "涨姿势"]
        let configure = SGPageTitleViewConfigure()
        configure.showIndicator = false
        configure.showBottomSeparator = false
        configure.titleColor = UIColor.gray
        configure.titleSelectedColor = UIColor.black
        configure.titleGradientEffect = true
        
        let height: CGFloat = 44
        let pageTitleViewY = navigationBarView.frame.size.height - height
        self.pageTitleView = SGPageTitleView(frame: CGRect(x: 0, y: pageTitleViewY, width: NENScreenWidth - NENVideoNavRightItemWidth, height: height), delegate: self, titleNames: titles, configure: configure)
        navigationBarView.insertSubview(pageTitleView!, at: 0)
        
        let oneVC = UIViewController()
        oneVC.view.backgroundColor = UIColor.green
        let twoVC = UIViewController()
        twoVC.view.backgroundColor = UIColor.yellow
        let threeVC = UIViewController()
        threeVC.view.backgroundColor = UIColor.orange
        let fourVC = UIViewController()
        fourVC.view.backgroundColor = UIColor.red
        let fiveVC = UIViewController()
        fiveVC.view.backgroundColor = UIColor.orange
        let sixVC = UIViewController()
        sixVC.view.backgroundColor = UIColor.red
        let sevenVC = UIViewController()
        sevenVC.view.backgroundColor = UIColor.orange
        let eightVC = UIViewController()
        eightVC.view.backgroundColor = UIColor.red
        let childVCs = [oneVC, twoVC, threeVC, fourVC, oneVC, twoVC, threeVC, fourVC, oneVC, twoVC, threeVC, fourVC, fiveVC, twoVC, sixVC, sevenVC, eightVC]
        
        let contentViewHeight = view.frame.size.height - self.pageTitleView!.frame.maxY
        let contentRect = CGRect(x: 0, y: (pageTitleView?.frame.maxY)!, width: view.frame.size.width, height: contentViewHeight)
        self.pageContentScrollView = SGPageContentScrollView(frame: contentRect, parentVC: self, childVCs: childVCs)
        pageContentScrollView?.delegateScrollView = self
        view.addSubview(pageContentScrollView!)
    }
}
// MARK: - - 设置 SGPagingView 代理方法
extension NENVideoViewController: SGPageTitleViewDelegate, SGPageContentScrollViewDelegate {
    func pageTitleView(pageTitleView: SGPageTitleView, index: Int) {
        pageContentScrollView?.setPageContentScrollView(index: index)
    }
    
    func pageContentScrollView(pageContentScrollView: SGPageContentScrollView, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        pageTitleView?.setPageTitleView(progress: progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}

// MARK: - - 搜索按钮点击事件处理
extension NENVideoViewController: NENVideoNavigationBarViewDelegate {
    func searchClick() {
        print("搜索按钮点击事件")
    }
}
