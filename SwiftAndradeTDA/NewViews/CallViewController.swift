//
//  CallViewController.swift
//  SwiftAndradeTDA
//
//  Created by Felipe Andrade on 21/07/21.
//

import UIKit

class CallViewController: BaseViewController, TDAViewController {
    typealias SetViewModel = CallViewModel
    var viewModel: SetViewModel
    
    required init(_ viewModel: SetViewModel) {
        self.viewModel = viewModel
        super.init()
        viewModel.viewDelegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension CallViewController: CallViewModelDelegate {}

protocol CallViewModelDelegate: AnyObject {
    
}

class CallViewModel: TDAViewModel {
    weak var viewDelegate: CallViewModelDelegate?
    
}
