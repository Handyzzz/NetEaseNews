//
//  NEHomeViewController.swift
//  NetEase
//
//  Created by kingsic on 2018/10/7.
//  Copyright © 2018年 kingsic. All rights reserved.
//

import UIKit

class NEHomeViewController: UIViewController {
    
    private var pageTitleView: SGPageTitleView? = nil
    private var pageContentScrollView: SGPageContentScrollView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.red
        
        // 添加 SGPagingView
        setupSGPagingView()
    }

}

extension NEHomeViewController {
    private func setupSGPagingView() {
        let statusHeight = UIApplication.shared.statusBarFrame.height
        var pageTitleViewY: CGFloat = 0.0
        if statusHeight == 20 {
            pageTitleViewY = 64
        } else {
            pageTitleViewY = 88
        }
        
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

extension NEHomeViewController: SGPageTitleViewDelegate, SGPageContentScrollViewDelegate {
    func pageTitleView(pageTitleView: SGPageTitleView, index: Int) {
        pageContentScrollView?.setPageContentScrollView(index: index)
    }
    
    func pageContentScrollView(pageContentScrollView: SGPageContentScrollView, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        pageTitleView?.setPageTitleView(progress: progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}
