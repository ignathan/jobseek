//
//  MockJobListViewModel.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import Combine
@testable import Jobseek

class MockJobListViewModel: JobListViewModel {
    
    let mockModel = JobListTVCModel(id: "100",
                                    positionTitle: "",
                                    companyName: "",
                                    location: "",
                                    description: "",
                                    applied: false)
    
    var refreshCalled = false
    
    lazy var itemsSubject = CurrentValueSubject<[JobListTVCModel], any Error>([mockModel])
    
    let endRefreshSubject = PassthroughSubject<Void, Never>()
    
    func refresh() {
        refreshCalled = true
    }
}
