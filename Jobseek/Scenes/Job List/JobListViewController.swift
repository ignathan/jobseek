//
//  JobListViewController.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import UIKit
import Combine

class JobListViewController: UIViewController {
    
    let rootView = JobListView()
    
    var viewModel: JobListViewModel
    
    var coordinator: MasterCoordinator
    
    var cancellables = Set<AnyCancellable>()
    
    init(viewModel: JobListViewModel,
         coordinator: MasterCoordinator) {
        
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "job_list_title".localized()
        
        rootView.jobTableView.register(JobListTVC.self,
                                       forCellReuseIdentifier: String(describing: JobListTVC.self))
        rootView.jobTableView.dataSource = self
        rootView.jobTableView.delegate = self
        
        rootView.refreshControl.addTarget(self, action: #selector(didBeginRefresh), for: .valueChanged)
        
        viewModel.itemsSubject
            .sink { [weak self] completion in
                
                guard self != nil, case let .failure(error) = completion else { return }
                
#if DEBUG
                print("😭 Login Error")
                dump(error)
#endif
            } receiveValue: { [weak self] _ in
                
                self?.rootView.jobTableView.reloadData()
                
            }.store(in: &cancellables)
        
        viewModel.endRefreshSubject
            .sink { [weak self] _ in
                self?.rootView.refreshControl.endRefreshing()
            }.store(in: &cancellables)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        refresh()
    }
    
    func refresh() {
        
        rootView.refreshControl.beginRefreshing()
        
        let offset = CGPoint(x: 0,
                             y: -rootView.refreshControl.frame.height)
        
        rootView.jobTableView.setContentOffset(offset, animated: true)
        
        didBeginRefresh()
    }
    
    @objc func didBeginRefresh() {
        viewModel.refresh()
    }
}

extension JobListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsSubject.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let items = viewModel.itemsSubject.value
        
        guard indexPath.row < items.count else { return .init(frame: .zero) }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: JobListTVC.self),
                                                    for: indexPath) as? JobListTVC {
            cell.bind(model: items[indexPath.row])
            return cell
        }
        return .init(frame: .zero)
    }
}
