//
//  NENVideoNavigationBarView.swift
//  NetEaseNews
//
//  Created by kingsic on 2018/10/8.
//  Copyright © 2018年 kingsic. All rights reserved.
//

import UIKit

protocol NENVideoNavigationBarViewDelegate: NSObjectProtocol {
    func searchClick()
}

class NENVideoNavigationBarView: UIView {

    private var rightBgImageView: UIImageView?
    private var search: UIButton?
    weak var delegate: NENVideoNavigationBarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
        var navHeight: CGFloat = 0.0
        if statusBarHeight == 20 {
            navHeight = 64
        } else {
            navHeight = 88
        }
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: navHeight)
        
        setupRightItem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NENVideoNavigationBarView {
    private func setupRightItem() {
        self.rightBgImageView = UIImageView(image: UIImage(named: "navbar_right_more_45x36_"))
        let width: CGFloat = NENVideoNavRightItemWidth
        let height: CGFloat = 44
        let x = frame.size.width - width - 15
        let y = frame.size.height - height
        rightBgImageView?.isUserInteractionEnabled = true
        rightBgImageView?.frame = CGRect(x: x, y: y, width: width, height: height)
        addSubview(rightBgImageView ?? UIView())
        
        self.search = UIButton(type: .custom)
        search?.setImage(UIImage(named: "nav_item_search_black_25x25_"), for: .normal)
        let searchWidth = search?.imageView?.image?.size.width ?? 0.0
        let searchHeight = search?.imageView?.image?.size.height ?? 0.0
        let searchX = 0.5 * (width - searchWidth) + 10
        let searchY = 0.5 * (height - searchHeight)
        search?.frame = CGRect(x: searchX, y: searchY, width: searchWidth, height: searchHeight)
        search?.addTarget(self, action: #selector(search_action), for: .touchUpInside)
        rightBgImageView?.addSubview(search ?? UIView())
    }
    
    @objc private func search_action() {
        delegate?.searchClick()
    }
}
