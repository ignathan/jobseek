//
//  JobDetailsViewModelTests.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import XCTest
@testable import Jobseek

final class JobDetailsViewModelTests: XCTestCase {
    
    func testGetDetailsSuccess() {
        // Given
        let sut = JobDetailsViewModelImpl(jobId: "")
        let repository = MockJobRepository(success: true)
        
        sut.repository = repository
        
        // When
        sut.getDetails()
        
        // Then
        XCTAssert(sut.titleSubject.value == repository.job.positionTitle)
        XCTAssert(sut.companySubject.value == repository.job.company.name)
        XCTAssert(sut.locationSubject.value == repository.job.location)
        XCTAssert(sut.industrySubject.value == repository.job.industry)
        
        let salary = String(format: "$%d - $%d",
                            repository.job.salaryRange.min,
                            repository.job.salaryRange.max)
        XCTAssert(sut.salarySubject.value == salary)
        
        XCTAssert(sut.appliedSubject.value == repository.job.applied)
        XCTAssert(sut.descSubject.value == repository.job.description)
    }
}
