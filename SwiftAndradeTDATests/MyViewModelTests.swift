//
//  PBViewModelTests.swift
//  SwiftAndradeTDATests
//
//  Created by Felipe Andrade on 12/07/21.
//

import XCTest
@testable import SwiftAndradeTDA

class MyViewModelTests: XCTestCase, ViewModelTestProtocol {
    typealias TestView = MyViewController
    
    typealias SetViewController = MyViewController
    typealias SetViewModel = MyViewModel
    
    var viewModel: MyViewModel?
    
    override func setUp() {
        //viewModel = PBViewModel()
    }

    override func tearDown() {

    }
    
    func testArchitecture() {
        viewModel = MyViewModel()
        testRules()
    }
}

class MyViewController: BaseViewController, TDAViewController {
    typealias SetViewModel = MyViewModel
    
    var viewModel: SetViewModel
    var collectionView: UICollectionView!
    
    required init(_ viewModel: MyViewModel) {
        self.viewModel = viewModel
        super.init()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    }
    
    
}

extension MyViewController: ViewModelDelegate {
    func setado() {
        
    }
}








class CallViewModelTests: XCTestCase, ViewModelTestProtocol {
    typealias SetViewController = CallViewController
    
    typealias SetViewModel = CallViewModel
    
    var viewModel: SetViewModel?
    
    func testArchitecture() {
        self.viewModel = CallViewModel()
        self.testRules()
    }
}
