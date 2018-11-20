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
        self.backgroundColor    = UIColor.brown
    }
    
}
