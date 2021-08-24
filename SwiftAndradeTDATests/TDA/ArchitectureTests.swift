//
//  ArchitectureTests.swift
//  SwiftAndradeTDATests
//
//  Created by Felipe Andrade on 11/07/21.
//

import XCTest
@testable import SwiftAndradeTDA

// definir uma subclasse para essa dentro do seu módulo
class SwiftTDATests: XCTestCase {
    
    func testApplicationArchitecture() {
        //Linhas abaixo ficaria na sua subclasse
        TDAArchitecture.shared.testBundles = [Bundle(for: type(of: self))]
        getClassesConformingProtocol()
    }
    
    func getClassesConformingProtocol() {
        let numberOfClasses = objc_getClassList(nil, 0)
        let allUsedClassesPointers = UnsafeMutablePointer<AnyClass>.allocate(capacity: Int(numberOfClasses))
        let autoreleasingAllClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(allUsedClassesPointers)
        let usedClassesCount: Int32 = objc_getClassList(autoreleasingAllClasses, numberOfClasses)
        
        let classesCount = Int(usedClassesCount)
        
        var classList: [String] = []
        for index in 0 ..< classesCount {
            let currentClass: AnyClass = allUsedClassesPointers[index]
            let className = String(describing: currentClass)
            if Bundle(for: currentClass) === Bundle(for: AppDelegate.self) ||
                Bundle(for: currentClass) === Bundle(for: type(of: self)) {
                classList.append(className)
            }
            
            if checkClassType(.viewController, currentClass: currentClass) {
                XCTFail("\(className) must use TDAViewController Protocol")
            } else if checkClassType(.viewModel, currentClass: currentClass) {
                XCTFail("\(className) must use TDAViewModel Protocol")
            } else if checkClassType(.coordinator, currentClass: currentClass) {
                XCTFail("\(className) must use TDACoordinator Protocol")
            } else if TDAArchitecture.shared.testBundles.contains(Bundle(for: currentClass)),
                      className.contains("ViewModel"),
                      !class_conformsToProtocol(currentClass, ViewModel.self) {
                XCTFail("\(className) must use ViewModelTestProtocol and run testRules()")
            }
        }
        
        checkViewModelsHaveTests(classList: classList)
    }
    
    private func checkViewModelsHaveTests(classList: [String]) {
        let viewModels = classList.filter({ $0.contains("ViewModel") && !$0.contains("Test")})
        
        for viewModel in viewModels where !classList.contains("\(viewModel)Tests") {
            XCTFail("\(viewModel) does not have tests")
        }
    }
    
    private func checkClassType(_ type: TDAArchitecture.MVVMC, currentClass: AnyClass) -> Bool {
        let className = String(describing: currentClass)
        
        guard !type.ruleExceptions.contains(className) else { return false }
        
        return className.contains(type.rawValue) &&
                TDAArchitecture.shared.appBundles.contains(Bundle(for: currentClass)) &&
                !class_conformsToProtocol(currentClass, type.protocolType)
    }
}
