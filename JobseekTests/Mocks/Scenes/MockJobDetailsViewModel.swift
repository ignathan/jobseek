//
//  MockJobDetailsViewModel.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import Combine
@testable import Jobseek

class MockJobDetailsViewModel: JobDetailsViewModel {
    
    let titleSubject = CurrentValueSubject<String, Never>("")
    
    let companySubject = CurrentValueSubject<String, Never>("")
    
    let locationSubject = CurrentValueSubject<String, Never>("")
    
    let industrySubject = CurrentValueSubject<String, Never>("")
    
    let salarySubject = CurrentValueSubject<String, Never>("")
    
    let appliedSubject = CurrentValueSubject<Bool, Never>(false)
    
    let descSubject = CurrentValueSubject<String, Never>("")
    
    var getDetailsCalled = false
    
    required init(jobId: String) {}
    
    func getDetails() {
        getDetailsCalled = true
    }
}
