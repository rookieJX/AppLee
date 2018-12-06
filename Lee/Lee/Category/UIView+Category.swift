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
        
        print("图片宽度：\(imageW!),图片高度：\(imageH!)")
        
        // 标题的尺寸
        let titleSize = stringSize(title: title, titleFont: font!)
        print("标题宽度：\(titleSize.width),标题高度：\(titleSize.height)")

        let totalW = (imageW! + titleSize.width) > self.frame.size.width ? imageW! + self.titleLabel!.intrinsicContentSize.width : imageW! + titleSize.width
        let totalH = (imageH! + titleSize.height) > self.frame.size.height ? imageH! + self.titleLabel!.intrinsicContentSize.height : imageH! + titleSize.height;
        print("总宽度：\(self.frame.size),总高度：\(self.frame.height)")
        print("计算总宽度：\(totalW),总高度：\(totalH)")
        // 设置按钮图片偏移
        self.imageEdgeInsets  = UIEdgeInsets(top: -titleSize.height, left: 0, bottom: 0, right: -(totalW/2 - imageW!/2))
        // 设置按钮文字偏移
        self.titleEdgeInsets  = UIEdgeInsets(top: imageH!/2, left: -(totalW/2 - imageW!/2), bottom: -(totalH/2 - titleSize.height/2), right: (totalW/2 - titleSize.width/2))
        print("图片尺寸：\(String(describing: self.imageView?.frame)) 文字尺寸：\(String(describing: self.titleLabel?.frame)) 总尺寸：\(self.frame)")
        
    }
    
    func stringSize(title: String,titleFont: Float) -> CGSize {
        let font = UIFont.systemFont(ofSize: CGFloat(titleFont))
        let attributes = [NSAttributedString.Key.font: font]
        let size = CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT))
        let bounds = title.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: attributes, context: nil)
        return bounds.size
    }
    
}
