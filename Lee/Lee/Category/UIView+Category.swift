//
//  UIView+Category.swift
//  Lee
//
//  Created by 王加祥 on 2018/11/20.
//  Copyright © 2018年 JX.Wang. All rights reserved.
//

import UIKit

extension UIButton {
    func config_title_button(title: String, target: Any, action: Selector, for controlEvents: UIControl.Event) {
        // Title
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .selected)
        self.setTitle(title, for: .highlighted)
        self.setTitleColor(UIColor.black, for: .normal)
        self.setTitleColor(UIColor.black, for: .selected)
        self.setTitleColor(UIColor.black, for: .normal)
        // font
        self.titleLabel?.font   = UIFont.systemFont(ofSize: 14.0)
        // Target
        self.addTarget(target, action: action, for: controlEvents)
    }
    
    
}
