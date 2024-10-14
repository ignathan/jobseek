//
//  JobRepository.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import Combine

protocol JobRepository {
    
    func getJobList() -> AnyPublisher<JobResponse, Error>
}

extension MasterRepository: JobRepository {
    
    func getJobList() -> AnyPublisher<JobResponse, Error> {
        return getResponse(endpointString: "v3/5341213a-76a4-46d6-a686-08d805a61bfc")
    }
}
