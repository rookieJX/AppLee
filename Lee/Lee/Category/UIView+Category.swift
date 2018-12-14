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
    
    func config_convert_title_bottom(buttonFrame: CGRect,title: String,titleFont: Float? = nil,imageName: String,target: Any? = nil,action: Selector? = nil) {
        let font                       = titleFont == nil ? 15.0 : titleFont
        self.frame                     = buttonFrame
        self.titleLabel?.font          = UIFont.systemFont(ofSize: CGFloat(font!))
        self.addTarget(target, action: action!, for: .touchUpInside)
        self.setImage(UIImage.init(named: imageName), for: .normal)
        self.showsTouchWhenHighlighted = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor.black, for: .normal)
        
        // 图片宽高
        let imageW = self.imageView?.frame.size.width
        let imageH = self.imageView?.frame.size.height
        
        // 标题的尺寸
        let titleSize = stringSize(title: title, titleFont: font!)
        
        let totalW = self.frame.size.width
        
        // 设置按钮图片偏移
        self.imageEdgeInsets  = UIEdgeInsets(top: 0, left: (totalW - imageW!)/2, bottom: titleSize.height+5, right: 0)
        // 设置按钮文字偏移
        self.titleEdgeInsets  = UIEdgeInsets(top: imageH!+5, left: -imageW!, bottom: 0, right: 0)
        
    }
    
    func stringSize(title: String,titleFont: Float) -> CGSize {
        let font = UIFont.systemFont(ofSize: CGFloat(titleFont))
        let attributes = [NSAttributedString.Key.font: font]
        let size = CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT))
        let bounds = title.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: attributes, context: nil)
        return bounds.size
    }
    
}


extension UILabel {
    func private_create_label(title: String? = nil,font: Float? = nil,titleColor: UIColor? = nil) {
        self.text      = title!
        self.textColor = titleColor!
        self.font      = UIFont.systemFont(ofSize: (font == nil ? 15 : CGFloat(font!)))
    }
}
