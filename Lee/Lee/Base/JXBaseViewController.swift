//
//  JXBaseViewController.swift
//  Lee
//
//  Created by 王加祥 on 2018/11/19.
//  Copyright © 2018年 JX.Wang. All rights reserved.
//

import UIKit

class JXBaseViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        event_show_navigation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - 导航栏
    func event_hide_navigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func event_show_navigation() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - 背景颜色
    func base_view_backgroundColor(color: UIColor? = nil) {
        color == nil ? (self.view.backgroundColor = UIColor.white) : (self.view.backgroundColor = color)
    }
    
    // MARK: - 状态栏颜色
    func base_view_statusBarColor(color: UIColor? = nil) {
        if let statusViewWindow = UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow {
            if let statusView = statusViewWindow.value(forKey: "statusBar") as? UIView {
                statusView.backgroundColor  = color == nil ? UIColor.white : color
            }
        }
    }
}
