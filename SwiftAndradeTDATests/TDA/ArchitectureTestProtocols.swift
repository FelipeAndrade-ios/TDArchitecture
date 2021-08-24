//
//  ArchitectureTestProtocols.swift
//  SwiftAndradeTDATests
//
//  Created by Felipe Andrade on 11/07/21.
//

import XCTest
@testable import SwiftAndradeTDA

protocol FlowProtocol: ViewModelFlowProtocol, ViewControllerFlowProtocol, ViewModel { }

protocol ViewModelTestProtocol: FlowProtocol {
    var viewModel: SetViewModel? { get set }
    
    func testArchitecture()
}

extension ViewModelTestProtocol where Self: XCTestCase {
    func testRules() {
        //testViewConstruction()
        testStrongReference()
    }
    
    func testViewConstruction() {
        let currentViewController: SetViewController? = SetViewController(viewModel as! SetViewController.SetViewModel)
        XCTAssertTrue(currentViewController?.tableView != nil || currentViewController?.collectionView != nil,
                      "\(SetViewController.self) must have components on the view, not objects directly, use a Tableview or CollectionView")
        
        XCTAssertFalse(currentViewController?.tableView != nil && currentViewController?.collectionView != nil,
                       "\(SetViewController.self) should not use a tableView and a collectionView on root. Example: use a cell to present the collection")
        
        // ViewCode
        if currentViewController?.tableView != nil,
//           TDAArchitecture.shared.appBundles.contains(where: { $0.path(forResource: String(describing: currentViewController), ofType: "xib") == nil }),
           Bundle.main.path(forResource: String(describing: currentViewController), ofType: "xib") == nil {
            
            XCTAssertTrue(currentViewController?.tableView.delegate === currentViewController,
                          "Delegate of tableView must be set on \(SetViewController.self)")
            XCTAssertTrue(currentViewController?.tableView.dataSource === currentViewController,
                          "DataSource of tableView must be set on \(SetViewController.self)")
            XCTAssertTrue(currentViewController is UITableViewDelegate && currentViewController is UITableViewDataSource,
                          "You should create an extension of \(SetViewController.self) conforming to UITableViewDelegate and UITableViewDataSource")
        }
    }
    
    func testStrongReference() {
        guard let viewModel = viewModel else {
            XCTFail("The viewModel \(String(describing: viewModel)) must be initialized before calling this function")
            return
        }
        
        var viewController: SetViewController? = SetViewController(viewModel as! SetViewController.SetViewModel)
        viewModel.viewDelegate = viewController as? SetViewModel.ViewDelegate
        XCTAssertNotNil(viewModel.viewDelegate, "Your protocol must access a TDAViewController and your viewController must subscribe the viewModel delegate")
        weak var weakViewController = viewController
        viewController = nil
        
        XCTAssertNil(weakViewController, "The delegates on \(SetViewModel.self) should have a WEAK reference")
    }
    
    func TimeX() {}
}
