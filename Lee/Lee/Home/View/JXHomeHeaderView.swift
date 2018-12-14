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

enum HeaderFuncType : Int {
    case HeaderFuncTypeHistory  = 1 // 历史价格查询
    case HeaderFuncTypeDiscount = 2 // 全网折扣
    case HeaderFuncTypeCheap    = 3 // 白菜商品
    case HeaderFuncTypeTop      = 4 // 好价Top榜
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
        let headerAddLayer             = private_create_layer(frame: CGRect(x: self.frame.size.width-20-50, y: 20, width: 50, height: 50))
        headerAddLayer.cornerRadius    = 25
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
        let buttonH = 90.0
        let buttonY = 20+50+20+55+20.0
        
        let historyButton = private_create_button(title: "历史价格", imageName: "home_header_history", headerType: .HeaderTypeHistory, frame: CGRect(x: 0, y: Double(buttonY), width: Double(buttonW), height: buttonH))
        self.addSubview(historyButton)
        
        let saveButton = private_create_button(title: "省钱控", imageName: "home_header_save", headerType: .HeaderTypeSave, frame: CGRect(x: (Double(buttonW)), y: Double(buttonY), width: Double(buttonW), height: buttonH))
        self.addSubview(saveButton)
        
        let ticketButton = private_create_button(title: "搜淘宝券", imageName: "home_header_ticket", headerType: .HeaderTypeTicket, frame: CGRect(x: (Double(buttonW) * 2), y: Double(buttonY), width: Double(buttonW), height: buttonH))
        self.addSubview(ticketButton)
        
        let cheapButton = private_create_button(title: " 白菜价", imageName: "home_header_cheap", headerType: .HeaderTypeCheap, frame: CGRect(x: (Double(buttonW) * 3), y: Double(buttonY), width: Double(buttonW), height: buttonH))
        self.addSubview(cheapButton)
        
        let goodButton = private_create_button(title: "好价订阅", imageName: "home_header_good", headerType: .HeaderTypeGood, frame: CGRect(x: (Double(buttonW) * 4), y: Double(buttonY), width: Double(buttonW), height: buttonH))
        self.addSubview(goodButton)
        
        
        // 创建4个模块
        let funcViewX = 20.0
        let funcViewY = buttonH + buttonY + 10.0
        let funcViewW = (self.frame.size.width - 60.0) / 2.0
        let funcViewH = 60.0
        
        let historyView = private_create_funcview(title: "历史价格查询", content: "识别商家套路", imageName: nil, funcType: .HeaderFuncTypeHistory, frame: CGRect(x: funcViewX, y: funcViewY, width: Double(funcViewW), height: funcViewH))
        self.addSubview(historyView)
        
        let discountView = private_create_funcview(title: "全网折扣", content: "最新最全优惠", imageName: nil, funcType: .HeaderFuncTypeDiscount, frame: CGRect(x: (Double(funcViewX)*2 + Double(funcViewW)), y: funcViewY, width: Double(funcViewW), height: funcViewH))
        self.addSubview(discountView)
        
        let cheapView = private_create_funcview(title: "白菜商品", content: "百万隐藏优惠券", imageName: nil, funcType: .HeaderFuncTypeCheap, frame: CGRect(x: funcViewX, y: funcViewY + 10.0 + funcViewH, width: Double(funcViewW), height: funcViewH))
        self.addSubview(cheapView)
        
        let topView = private_create_funcview(title: "好价Top榜", content: "小时热销排行", imageName: nil, funcType: .HeaderFuncTypeTop, frame: CGRect(x: (Double(funcViewX)*2 + Double(funcViewW)), y: funcViewY + 10.0 + funcViewH, width: Double(funcViewW), height: funcViewH))
        self.addSubview(topView)
        
        // 创建分割View
        let horizonLineView = UIView.init(frame: CGRect(x: 0, y: topView.frame.maxY + 10.0, width: self.frame.size.width, height: 15.0))
        horizonLineView.backgroundColor     = UIColor(displayP3Red: 230/256.0, green: 230/256.0, blue: 230/256.0, alpha: 1)
        self.addSubview(horizonLineView)
        
        
    }
    
    @objc func buttonClick() {
        print("点击")
    }
    
    // MARK: - Private Meth
    func private_create_button(title: String,imageName: String,headerType: HeaderButtonType,frame: CGRect) -> UIButton {
        let button = UIButton.init(type: .custom)
        button.config_convert_title_bottom(buttonFrame: frame, title: title, titleFont: 13, imageName: imageName, target: nil, action: #selector(buttonClick))
        return button
    }
    
    func private_create_funcview(title: String,content: String,imageName: String? = nil,funcType: HeaderFuncType,frame: CGRect) -> UIView {
        // 背景
        let funcView = UIView.init(frame: frame)
        funcView.clipsToBounds      = true
        funcView.layer.cornerRadius = 5
        funcView.backgroundColor    = UIColor.white
        
        // 创建阴影
        let headerAddLayer             = private_create_layer(frame: frame)
        self.layer.addSublayer(headerAddLayer)
        
        // 标题
        let titleLabel = private_create_label(title: title, font: 14, titleColor: UIColor.black)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.frame    = CGRect(x: 5.0, y: 15.0, width: frame.size.width - 10.0, height: 15.0)
        funcView.addSubview(titleLabel)
        // 内容
        let contentLabel = private_create_label(title: content, font: 13, titleColor: UIColor.lightGray)
        contentLabel.frame  = CGRect(x: 5.0, y: 40.0, width: frame.size.width - 10.0 - 50.0, height: 15.0)
        funcView.addSubview(contentLabel)
        
        
        return funcView
    }
    
    func private_create_label(title: String? = nil,font: Float? = nil,titleColor: UIColor? = nil) -> UILabel {
        let label = UILabel.init()
        label.text      = title!
        label.textColor = titleColor!
        label.font      = UIFont.systemFont(ofSize: (font == nil ? 15 : CGFloat(font!)))
        return label
    }
    
    func private_create_layer(frame: CGRect) -> CALayer {
        let layer             = CALayer()
        layer.frame           = frame
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowOffset    = CGSize(width: 3, height: 3)
        layer.shadowOpacity   = 0.2
        layer.shadowColor     = UIColor.lightGray.cgColor
        return layer
    }

}
