//
//  JXFakeController.swift
//  Lee
//
//  Created by 王加祥 on 2018/11/20.
//  Copyright © 2018年 JX.Wang. All rights reserved.
//

import UIKit

class JXFakeController: JXBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        event_show_navigation()
        
        config_fake_view()

    }
    
    func config_fake_view() {
        self.view.backgroundColor   = UIColor.white
    }
    
}
