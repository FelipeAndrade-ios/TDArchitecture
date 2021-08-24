//
//  SwiftAndradeTDATests.swift
//  SwiftAndradeTDATests
//
//  Created by Felipe Andrade on 10/07/21.
//

import XCTest
@testable import SwiftAndradeTDA

class OpaViewModelTests: XCTestCase, ViewModelTestProtocol {
    typealias SetViewModel = OpaViewModel
    typealias SetViewController = OpaViewController
    
    var viewModel: SetViewModel?
    
    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func testArchitecture() {
        self.viewModel = OpaViewModel()
        self.testRules()
    }

}

extension OpaViewModelTests: ViewModelDelegate {
    func setado() {
        
    }
}

class TimesViewModelTests: XCTestCase, ViewModelTestProtocol {
    typealias SetViewController = TimesViewController
    typealias SetViewModel = TimesViewModel
    
    var viewModel: TimesViewModel?
    
    func testArchitecture() {
        viewModel = TimesViewModel()
        testRules()
    }
}
