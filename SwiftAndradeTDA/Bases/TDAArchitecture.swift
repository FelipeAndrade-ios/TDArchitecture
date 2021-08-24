//
//  TDAArchitecture.swift
//  SwiftAndradeTDA
//
//  Created by Felipe Andrade on 19/07/21.
//

import Foundation

class TDAArchitecture {
    static var shared = TDAArchitecture()
    
    enum MVVMC: String {
        case viewController = "ViewController"
        case viewModel = "ViewModel"
        case coordinator = "Coordinator"
        
        var ruleExceptions: [String] {
            switch self {
            case .viewController:
                return TDAArchitecture.shared.viewControllers
            case .viewModel:
                return TDAArchitecture.shared.viewModels
            case .coordinator:
                return TDAArchitecture.shared.coordinators
            }
        }
        
        var protocolType: Protocol {
            switch self {
            case .viewController:
                return ViewController.self
            case .viewModel:
                return ViewModel.self
            case .coordinator:
                return Coordinator.self
            }
        }
    }
    
    private var viewControllers: [String] = []
    private var viewModels: [String] = []
    private var coordinators: [String] = []
    
    var appBundles: [Bundle] = []
    var testBundles: [Bundle] = []
    
    func setRuleExceptions(viewControllers: [String], viewModels: [String] = [], coordinators: [String] = []) {
        self.viewControllers = viewControllers
        self.viewModels = viewModels
        self.coordinators = coordinators
    }
}
