//
//  JXTabBarController.swift
//  Lee
//
//  Created by 王加祥 on 2018/11/19.
//  Copyright © 2018年 JX.Wang. All rights reserved.
//

import UIKit

class JXTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        config_subControllers()

    }
    
    private func config_subControllers() {
        let home        = config_nav(controller: JXHomeController())
        home.tabBarItem = config_tabbar(title: "首页",
                                        selectImageName: "home_select",
                                        normalImageName: "home_normal")
        self.addChild(home)
        
        let value        = config_nav(controller: JXValueController())
        value.tabBarItem = config_tabbar(title: "比价",
                                         selectImageName: "value_select",
                                         normalImageName: "value_normal")
        self.addChild(value)
        
        let discount        = config_nav(controller: JXDiscountController())
        discount.tabBarItem = config_tabbar(title: "折扣",
                                            selectImageName: "discount_select",
                                            normalImageName: "discount_normal")
        self.addChild(discount)
        
        let mine        = config_nav(controller: JXMineController())
        mine.tabBarItem = config_tabbar(title: "我的",
                                        selectImageName: "mine_select",
                                        normalImageName: "mine_normal")
        self.addChild(mine)
        
    }
    
    private func config_tabbar(title: String,selectImageName: String,normalImageName: String) -> UITabBarItem {
        let tabbarItem = UITabBarItem(title: title,
                                      image: UIImage(named: normalImageName)?.withRenderingMode(.alwaysOriginal),
                                      selectedImage: UIImage(named: selectImageName)?.withRenderingMode(.alwaysOriginal))
        
        tabbarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(displayP3Red: 216.0/255, green: 30.0/255, blue: 6.0/255, alpha: 1)], for: UIControl.State.selected)
        
        
        tabbarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(displayP3Red: 51.0/255, green: 51.0/255, blue: 51.0/255, alpha: 1)], for: .normal)
        
        return tabbarItem
    }

    private func config_nav(controller: UIViewController) -> UINavigationController {
        let nav = JXNavigationController.init(rootViewController: controller)
        return nav
    }
    
    
}
