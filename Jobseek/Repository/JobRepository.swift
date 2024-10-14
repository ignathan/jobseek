//
//  JobRepository.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import Combine

protocol JobRepository {
    
    func getJobList() -> AnyPublisher<JobResponse, Error>
    
    func getJobDetails(id: String) -> AnyPublisher<Job, Error>
}

extension MasterRepository: JobRepository {
    
    func getJobList() -> AnyPublisher<JobResponse, Error> {
        return getResponse(endpointString: "v3/5341213a-76a4-46d6-a686-08d805a61bfc")
    }
    
    func getJobDetails(id: String) -> AnyPublisher<Job, any Error> {
        return getResponse(endpointString: "v3/a6005368-b882-469c-9640-ad6cfaf855df")
    }
}
