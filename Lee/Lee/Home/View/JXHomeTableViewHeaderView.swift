//
//  JXHomeTableViewHeaderView.swift
//  Lee
//
//  Created by 王加祥 on 2018/11/20.
//  Copyright © 2018年 JX.Wang. All rights reserved.
//

import UIKit

class JXHomeTableViewHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        config_home_tableViewHeader_subView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config_home_tableViewHeader_subView() {
        self.backgroundColor    = UIColor.white
        
        // 创建标题
        let titleLabel = UILabel.init(frame: CGRect(x: 20.0, y: 0, width: self.frame.size.width - 40.0 - 60.0, height: self.frame.size.height))
        titleLabel.private_create_label(title: "今日超值推荐", font: 18, titleColor: UIColor.black)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.addSubview(titleLabel)
        
        // 创建常见问题
        let questionButton = UIButton(type: .custom)
        questionButton.config_title_button(title: "常见问题", target: self, action: #selector(actionForQuestion), for: .touchUpInside)
        questionButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        questionButton.setTitleColor(UIColor.lightGray, for: .normal)
        questionButton.frame    = CGRect(x: self.frame.maxX - 20.0 - 60.0, y: 0, width: 60.0, height: self.frame.size.height)
        self.addSubview(questionButton)
        
        // 创建分割线
        let horizonLineView = UIView.init(frame: CGRect(x: 0, y: self.frame.maxY - 1.0, width: self.frame.size.width, height: 1.0))
        horizonLineView.backgroundColor = UIColor(displayP3Red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1)
        self.addSubview(horizonLineView)
    }
    
    @objc func actionForQuestion() {
        
    }
    
}
