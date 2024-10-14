//
//  JobDetailsViewModel.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import Combine

protocol JobDetailsViewModel {
    
    var titleSubject: CurrentValueSubject<String, Never> { get }
    
    var companySubject: CurrentValueSubject<String, Never> { get }
    
    var locationSubject: CurrentValueSubject<String, Never> { get }
    
    var industrySubject: CurrentValueSubject<String, Never> { get }
    
    var salarySubject: CurrentValueSubject<String, Never> { get }
    
    var appliedSubject: CurrentValueSubject<Bool, Never> { get }
    
    var descSubject: CurrentValueSubject<String, Never> { get }
    
    init(jobId: String)
    
    func getDetails()
}

class JobDetailsViewModelImpl: JobDetailsViewModel {
    
    let titleSubject = CurrentValueSubject<String, Never>("")
    
    let companySubject = CurrentValueSubject<String, Never>("")
    
    let locationSubject = CurrentValueSubject<String, Never>("")
    
    let industrySubject = CurrentValueSubject<String, Never>("")
    
    let salarySubject = CurrentValueSubject<String, Never>("")
    
    let appliedSubject = CurrentValueSubject<Bool, Never>(false)
    
    let descSubject = CurrentValueSubject<String, Never>("")
    
    let jobId: String
    
    var repository: JobRepository = MasterRepository.shared
    
    var cancellables = Set<AnyCancellable>()
    
    required init(jobId: String) {
        self.jobId = jobId
    }
    
    func getDetails() {
        
        repository.getJobDetails(id: jobId)
            .sink { [weak self] completion in
                
                guard self != nil,
                      case let .failure(error) = completion else { return }
#if DEBUG
                print("😭 Login Error")
                dump(error)
#endif
            } receiveValue: { [weak self] response in
                
                self?.presentJobDetails(job: response)
                
            }.store(in: &cancellables)
    }
    
    func presentJobDetails(job: Job) {
        
        titleSubject.send(job.positionTitle)
        
        companySubject.send(job.company.name)
        
        locationSubject.send(job.location)
        
        industrySubject.send(job.industry)
        
        salarySubject.send(String(format: "$%d - $%d", job.salaryRange.min, job.salaryRange.max))
        
        appliedSubject.send(job.applied)
        
        descSubject.send(job.description)
    }
}
