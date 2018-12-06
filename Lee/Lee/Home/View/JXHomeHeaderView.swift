//
//  JXHomeHeaderView.swift
//  Lee
//
//  Created by 王加祥 on 2018/11/20.
//  Copyright © 2018年 JX.Wang. All rights reserved.
//

import UIKit

enum HeaderButtonType : Int {
    case HeaderTypeHistory = 1  // 查询历史价格
    case HeaderTypeSave    = 2  // 省钱控
    case HeaderTypeTicket  = 3  // 搜淘宝券
    case HeaderTypeCheap   = 4  // 白菜价
    case HeaderTypeGood    = 5  // 好价订阅
}

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
        
        // 创建按钮
        let buttonW = self.frame.size.width / 5.0
        print("界面宽度\(self.frame.size.width)，按钮宽度\(buttonW)")
        let buttonH = 90.0
        
        let historyButton = private_create_button(title: "历史价格", imageName: "home_header_history", headerType: .HeaderTypeHistory, frame: CGRect(x: 20, y: 20+50+20+55+20, width: Double(buttonW), height: buttonH))
        self.addSubview(historyButton)
        
        
    }
    
    @objc func buttonClick() {
        print("点击")
    }
    
    // MARK: - Private Meth
    func private_create_button(title: String,imageName: String,headerType: HeaderButtonType,frame: CGRect) -> UIButton {
        let button = UIButton.init(type: .custom)
        button.backgroundColor  = UIColor.red
        button.config_convert_title_bottom(buttonFrame: frame, title: title, titleFont: 13, imageName: imageName, target: nil, action: #selector(buttonClick))
        return button
    }

}
