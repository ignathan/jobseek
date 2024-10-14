//
//  JobListViewModel.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import Foundation
import Combine

protocol JobListViewModel {
    
    var itemsSubject: CurrentValueSubject<[JobListTVCModel], Error> { get }
    
    var endRefreshSubject: PassthroughSubject<Void, Never> { get }
    
    func refresh()
}

class JobListViewModelImpl: JobListViewModel {
    
    let itemsSubject = CurrentValueSubject<[JobListTVCModel], any Error>([])
    
    let endRefreshSubject = PassthroughSubject<Void, Never>()
    
    var repository: JobRepository = MasterRepository.shared
    
    var cancellables = Set<AnyCancellable>()
    
    func refresh() {
        
        repository.getJobList()
            .sink { [weak self] completion in
                
                guard let self else { return }
                
                self.endRefreshSubject.send()
                
                guard  case let .failure(error) = completion else { return }
#if DEBUG
                print("😭 Login Error")
                dump(error)
#endif
            } receiveValue: { [weak self] response in
                
                self?.presentJobList(response: response)
                
            }.store(in: &cancellables)
    }
    
    func presentJobList(response: JobResponse) {
        
        var items = [JobListTVCModel]()
        
        for job in response.jobs
        where job.status == .PUBLISHED {
            
            let model = JobListTVCModel(id: job.id,
                                        positionTitle: job.positionTitle,
                                        companyName: job.company.name,
                                        location: job.location,
                                        description: job.description,
                                        applied: job.applied)
            items.append(model)
        }
        itemsSubject.send(items)
    }
}
