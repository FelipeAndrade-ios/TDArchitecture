//
//  TimesViewController.swift
//  SwiftAndradeTDA
//
//  Created by Felipe Andrade on 16/07/21.
//

import UIKit

protocol TimesViewModelDelegate: AnyObject {
    
}

class TimesViewController: BaseViewController, TDAViewController {
    typealias SetViewModel = TimesViewModel
    var viewModel: TimesViewModel
    
    required init(_ viewModel: TimesViewModel) {
        self.viewModel = viewModel
        super.init()
        
        viewModel.viewDelegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension TimesViewController: TimesViewModelDelegate {}

class TimesViewModel: TDAViewModel {
    weak var viewDelegate: TimesViewModelDelegate?
    
}
