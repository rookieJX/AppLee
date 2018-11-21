//
//  JXHomeHeaderView.swift
//  Lee
//
//  Created by 王加祥 on 2018/11/20.
//  Copyright © 2018年 JX.Wang. All rights reserved.
//

import UIKit

class JXHomeHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        config_home_header_subView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config_home_header_subView() {
        self.backgroundColor    = UIColor.white
        
        let headerImageView   = UIImageView.init(image: UIImage.init(named: "home_header_normal"))
        headerImageView.frame = CGRect(x: 20, y: 20, width: headerImageView.frame.size.width, height: headerImageView.frame.size.height)
        self.addSubview(headerImageView)
        
        
        // 添加
        let headerAddLayer             = CALayer()
        headerAddLayer.frame           = CGRect(x: self.frame.size.width-20-50, y: 20, width: 50, height: 50)
        headerAddLayer.backgroundColor = UIColor.lightGray.cgColor
        headerAddLayer.shadowOffset    = CGSize(width: 3, height: 3)
        headerAddLayer.cornerRadius    = 25
        headerAddLayer.shadowOpacity   = 0.2
        self.layer.addSublayer(headerAddLayer)

        let headerAddButton                = UIButton.init(type: .custom)
        headerAddButton.frame              = CGRect(x: self.frame.size.width-20-50, y: 20, width: 50, height: 50)
        headerAddButton.backgroundColor    = UIColor.white
        headerAddButton.clipsToBounds      = true
        headerAddButton.layer.cornerRadius = 25.0
        headerAddButton.setBackgroundImage(UIImage.init(named: "home_header_add"), for: .normal)
        self.addSubview(headerAddButton)
        
        
        // 搜索
        let headerSearchButton = UIButton.init(type: .custom)
        headerSearchButton.frame   = CGRect(x: 20, y: 20+50+20, width: self.frame.size.width-40, height: 55)
        headerSearchButton.setBackgroundImage(UIImage.init(named: "home_header_search"), for: .normal)
        self.addSubview(headerSearchButton)
        
        // 创建图片
        let button = UIButton.init(type: .custom)
        button.backgroundColor  = UIColor.white
        button.config_convert_title_bottom(buttonFrame: CGRect(x: 20, y: 20+50+20+55+20, width: 150, height: 100),
                                           title: "历史价格",
                                           titleFont: 14,
                                           imageName: "home_header_add",
                                           target: nil,
                                           action: #selector(buttonClick))
        self.addSubview(button)
        
        
    }
    
    @objc func buttonClick() {
        print("点击")
    }

}
