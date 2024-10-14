//
//  MockJobRepository.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import Foundation
import Combine
@testable import Jobseek

class MockJobRepository: JobRepository {
    
    let job = Job(id: "100",
                  positionTitle: "",
                  description: "",
                  company: .init(id: "100", name: ""),
                  salaryRange: .init(min: 0, max: 100),
                  location: "",
                  industry: "",
                  status: .PUBLISHED,
                  createdAt: "",
                  updatedAt: "",
                  applied: true)
    
    lazy var jobResponse = JobResponse(page: 1,
                                  size: 0,
                                  total: 0,
                                  hasNext: false,
                                  jobs: [job])
    
    let success: Bool
    
    init(success: Bool) {
        self.success = success
    }
    
    func getJobList() -> AnyPublisher<JobResponse, Error> {
        if success {
            return Just(jobResponse).setFailureType(to: Error.self).eraseToAnyPublisher()
        } else {
            return Fail(error: MockError.resultError).eraseToAnyPublisher()
        }
    }
}
