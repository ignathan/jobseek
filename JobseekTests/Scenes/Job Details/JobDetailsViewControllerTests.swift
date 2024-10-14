//
//  JobDetailsViewControllerTests.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import XCTest
@testable import Jobseek

final class JobDetailsViewControllerTests: XCTestCase {
    
    let mockViewModel = MockJobDetailsViewModel(jobId: "")
    let mockCoordinator = MockMasterCoordinator()
    
    func testGetDetails() {
        // Given
        let sut = JobDetailsViewController(viewModel: mockViewModel,
                                           coordinator: mockCoordinator)
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertTrue(mockViewModel.getDetailsCalled)
    }
}
