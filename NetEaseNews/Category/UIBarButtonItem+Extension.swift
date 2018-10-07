//
//  UIBarButtonItem+Extension.swift
//  UIBarButtonItem+Extension
//
//  Created by kingsic on 2018/2/2.
//  Copyright © 2018年 kingsic. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /// 快速创建带有图片的 UIBarButtonItem
    convenience init(target: Any, acrion:Selector, imageName: String) {
        let btn = UIButton()
        btn.addTarget(target, action: acrion, for: .touchUpInside)
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName), for: .highlighted)
        btn.sizeToFit()
        self.init(customView: btn)
    }
    
    /// 快速创建带有高亮图片的 UIBarButtonItem
    convenience init(target: Any, acrion:Selector, imageName: String, highImageName: String) {
        self.init()
        let btn = UIButton()
        btn.addTarget(target, action: acrion, for: .touchUpInside)
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.sizeToFit()
        self.customView = btn
    }
}

