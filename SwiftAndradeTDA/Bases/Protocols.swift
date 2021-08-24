//
//  Protocols.swift
//  SwiftAndradeTDA
//
//  Created by Felipe Andrade on 11/07/21.
//

import UIKit

//TODO
@objc protocol Coordinator { }
protocol TDACoordinator: Coordinator {

}





// Main Objects
protocol ViewModelFlowProtocol {
    associatedtype SetViewController: TDAViewController
}

protocol ViewControllerFlowProtocol {
    associatedtype SetViewModel: TDAViewModel
}






// MARK: ViewController Protocol
@objc protocol ViewController {}

protocol TDAViewController: BaseViewController, ViewController, ViewControllerFlowProtocol {
    var viewModel: SetViewModel { get set }
//    var tableView: UITableView! { get set }
//    var collectionView: UICollectionView! { get set }
    
    init(_ viewModel: SetViewModel)
}

extension TDAViewController {
    var tableView: UITableView! {
        get { nil }
        set {}
    }
    var collectionView: UICollectionView! {
        get { nil }
        set {}
    }
}






// MARK: ViewModel Protocol
@objc protocol ViewModel {}

protocol TDAViewModel:  ViewModel {
    
    associatedtype ViewDelegate
    associatedtype CoordinatorDelegate
    
    var viewDelegate: ViewDelegate? { get set }
    var coordinatorDelegate: CoordinatorDelegate? { get set }
}

extension TDAViewModel {
    var coordinatorDelegate: Coordinator? {
        get { return nil } set { }
    }
}
