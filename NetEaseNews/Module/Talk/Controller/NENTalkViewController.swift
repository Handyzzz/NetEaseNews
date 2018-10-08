//
//  NENTalkViewController.swift
//  NetEaseNews
//
//  Created by kingsic on 2018/10/8.
//  Copyright © 2018年 kingsic. All rights reserved.
//

import UIKit

class NENTalkViewController: UIViewController {
    private var pageTitleView: SGPageTitleView? = nil
    private var pageContentScrollView: SGPageContentScrollView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
        // 设置导航栏
        setupNavigationBar()
        
        // 添加 SGPagingView
        setupSGPagingView()
    }
}

// MARK: - - 设置导航栏
extension NENTalkViewController {
    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
    }
}

// MARK: - - 设置 SGPagingView
extension NENTalkViewController {
    private func setupSGPagingView() {
        let viewWidth: CGFloat = view.frame.size.width
        
        let titles = ["最新", "热门", "关注"]
        let configure = SGPageTitleViewConfigure()
        configure.needBounces = false
        configure.showIndicator = false
        configure.showBottomSeparator = false
        configure.titleColor = UIColor.gray
        configure.titleSelectedColor = UIColor.black
        configure.titleGradientEffect = true
        configure.titleFont = UIFont.systemFont(ofSize: 18)
        
        self.pageTitleView = SGPageTitleView(frame: CGRect(x: 0, y: 0, width:viewWidth  * 2 / 3, height: 44), delegate: self, titleNames: titles, configure: configure)
        pageTitleView?.index = 1
        navigationItem.titleView = pageTitleView
        
        let oneVC = UIViewController()
        oneVC.view.backgroundColor = UIColor.green
        let twoVC = UIViewController()
        twoVC.view.backgroundColor = UIColor.yellow
        let threeVC = UIViewController()
        threeVC.view.backgroundColor = UIColor.orange
        let childVCs = [oneVC, twoVC, threeVC]
        
        let contentViewHeight = view.frame.size.height
        let contentRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: contentViewHeight)
        self.pageContentScrollView = SGPageContentScrollView(frame: contentRect, parentVC: self, childVCs: childVCs)
        pageContentScrollView?.delegateScrollView = self
        view.addSubview(pageContentScrollView!)
    }
}
// MARK: - - 设置 SGPagingView 代理方法
extension NENTalkViewController: SGPageTitleViewDelegate, SGPageContentScrollViewDelegate {
    func pageTitleView(pageTitleView: SGPageTitleView, index: Int) {
        pageContentScrollView?.setPageContentScrollView(index: index)
    }
    
    func pageContentScrollView(pageContentScrollView: SGPageContentScrollView, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        pageTitleView?.setPageTitleView(progress: progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}

