//
//  JobDetailsViewController.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import UIKit
import Combine

class JobDetailsViewController: UIViewController {
    
    let rootView = JobDetailsView()
    
    let viewModel: JobDetailsViewModel
    
    let coordinator: MasterCoordinator
    
    var cancellables = Set<AnyCancellable>()
    
    init(viewModel: JobDetailsViewModel, coordinator: MasterCoordinator) {
        
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
        
        navigationItem.title = nil
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(didTapBack))
        
        viewModel.titleSubject.sink { [weak self] title in
            self?.rootView.titleLabel.text = title
        }.store(in: &cancellables)
        
        viewModel.companySubject.sink { [weak self] companyName in
            self?.navigationItem.title = companyName
            self?.rootView.companyLabel.text = companyName
        }.store(in: &cancellables)
        
        viewModel.locationSubject.sink { [weak self] location in
            self?.rootView.locationLabel.text = location
        }.store(in: &cancellables)
        
        viewModel.industrySubject.sink { [weak self] industry in
            self?.rootView.industryLabel.text = industry
        }.store(in: &cancellables)
        
        viewModel.salarySubject.sink { [weak self] salary in
            self?.rootView.salaryLabel.text = salary
        }.store(in: &cancellables)
        
        viewModel.appliedSubject.sink { [weak self] applied in
            self?.rootView.appliedStackView.isHidden = !applied
        }.store(in: &cancellables)
        
        viewModel.descSubject.sink { [weak self] description in
            self?.rootView.descriptionLabel.text = description
        }.store(in: &cancellables)
        
        viewModel.getDetails()
    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
