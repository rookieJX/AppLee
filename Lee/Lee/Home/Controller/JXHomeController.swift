//
//  JXHomeController.swift
//  Lee
//
//  Created by 王加祥 on 2018/11/19.
//  Copyright © 2018年 JX.Wang. All rights reserved.
//

import UIKit

class JXHomeController: JXBaseViewController,UITableViewDelegate,UITableViewDataSource {
    // MARK: - 属性
    var tableView: UITableView?
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        event_hide_navigation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        base_view_statusBarColor(color: UIColor.white)
        
        config_home_tableView()
        
        config_home_tableView_header()
    }
    
    // MARK: - UI
    func config_home_tableView() {
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
        self.tableView?.backgroundColor = UIColor.white
        self.tableView?.delegate    = self
        self.tableView?.dataSource  = self
        self.view.addSubview(self.tableView!)
    }
    
    func config_home_tableView_header() {
        let tableViewHeaderView = JXHomeHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        self.tableView?.tableHeaderView = tableViewHeaderView
    }

    // MARK: - UITableViewDelegate && DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(JXFakeController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: String(describing: UITableViewCell.self))
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.textLabel?.text    = "当前行：\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = JXHomeTableViewHeaderView (frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
}
