//
//  JobListViewControllerTests.swift
//  JobseekTests
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import XCTest
@testable import Jobseek

final class JobListViewControllerTests: XCTestCase {
    
    let mockVM = MockJobListViewModel()
    let mockCoordinator = MockMasterCoordinator()
    
    func testReloadTable() {
        // Given
        let sut = JobListViewController(viewModel: mockVM,
                                        coordinator: mockCoordinator)
        
        let mockTableView = MockTableView()
        sut.rootView.jobTableView = mockTableView
        
        // When
        sut.viewDidLoad()
        mockVM.itemsSubject.send([])
        
        // Then
        XCTAssertTrue(mockTableView.reloadDataCalled)
    }
    
    func testEndRefresh() {
        // Given
        let sut = JobListViewController(viewModel: mockVM,
                                        coordinator: mockCoordinator)
        
        let mockRefreshControl = MockRefreshControl()
        sut.rootView.refreshControl = mockRefreshControl
        
        // When
        sut.viewDidLoad()
        mockVM.endRefreshSubject.send()
        
        // Then
        XCTAssertTrue(mockRefreshControl.endRefreshingCalled)
    }
    
    func testRefreshCalled() {
        // Given
        let sut = JobListViewController(viewModel: mockVM,
                                        coordinator: mockCoordinator)
        let mockRefreshControl = MockRefreshControl()
        sut.rootView.refreshControl = mockRefreshControl
        
        // When
        sut.refresh()
        
        // Then
        XCTAssertTrue(mockVM.refreshCalled)
    }
    
    func testTableCount() {
        // Given
        let sut = JobListViewController(viewModel: mockVM,
                                        coordinator: mockCoordinator)
        
        // When
        let count = sut.tableView(sut.rootView.jobTableView, numberOfRowsInSection: 0)
        
        // Then
        XCTAssert(count == 1)
    }
    
    func testTableCell() {
        // Given
        let sut = JobListViewController(viewModel: mockVM,
                                        coordinator: mockCoordinator)
        
        // When
        sut.viewDidLoad()
        guard let cell = sut.tableView(sut.rootView.jobTableView,
                                       cellForRowAt: IndexPath(item: 0, section: 0)) as? JobListTVC
        else {
            XCTFail("Invalid Cell")
            return
        }
        // Then
        XCTAssertEqual(cell.titleLabel.text, mockVM.mockModel.positionTitle)
    }
    
    func testDidSelect() {
        // Given
        let sut = JobListViewController(viewModel: mockVM,
                                        coordinator: mockCoordinator)
        
        // When
        sut.tableView(sut.rootView.jobTableView,
                      didSelectRowAt: IndexPath(item: 0, section: 0))
        
        // Then
        XCTAssertTrue(mockCoordinator.pushJobDetailsCalled)
    }
}
