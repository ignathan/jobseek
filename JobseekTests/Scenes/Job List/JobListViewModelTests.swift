//
//  JobListViewModelTests.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import XCTest
import Combine
@testable import Jobseek

final class JobListViewModelTests: XCTestCase {
    
    func testRefreshSuccess() {
        // Given
        let sut = JobListViewModelImpl()
        
        let repository = MockJobRepository(success: true)
        
        sut.repository = repository
        
        var cancellables = Set<AnyCancellable>()
        
        var endRefreshCalled = false
        sut.endRefreshSubject.sink { _ in
            endRefreshCalled = true
        }.store(in: &cancellables)
        
        // When
        sut.refresh()
        
        // Then
        XCTAssertTrue(endRefreshCalled)
        XCTAssert(sut.itemsSubject.value.first?.id == repository.job.id)
    }
}
