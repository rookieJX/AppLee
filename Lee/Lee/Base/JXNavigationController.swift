//
//  JXNavigationController.swift
//  Lee
//
//  Created by 王加祥 on 2018/11/20.
//  Copyright © 2018年 JX.Wang. All rights reserved.
//

import UIKit

class JXNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = config_back()
        }
        super.pushViewController(viewController, animated: animated)
    }

    private func config_back() -> UIBarButtonItem {
        let backButton = UIButton.init(type: .custom)
        backButton.frame.size   = CGSize(width: 50, height: 0)
        backButton.config_title_button(title: "返回", target: self, action: #selector(action_backButton_back), for: .touchUpInside)
        backButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        let barButtonItem = UIBarButtonItem.init(customView: backButton)
        return barButtonItem
    }



    @objc func action_backButton_back() {
        self.popViewController(animated: true)
    }

}
