//
//  JobListView.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import UIKit

class JobListView: UIView {
    
    var jobTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "job_list_refresh".localized())
        return refreshControl
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .backgroundSecondary
        
        addSubview(jobTableView)
        
        jobTableView.addSubview(refreshControl)
        
        NSLayoutConstraint.activate([
            jobTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            jobTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            jobTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            jobTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
