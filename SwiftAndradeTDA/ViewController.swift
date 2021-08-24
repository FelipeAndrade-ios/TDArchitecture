//
//  ViewController.swift
//  SwiftAndradeTDA
//
//  Created by Felipe Andrade on 10/07/21.
//

import UIKit

class ViewControllerA: BaseViewController, TDAViewController {
    var viewModel: SetViewModel
    
    required init(_ viewModel: SetViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    typealias SetViewModel = OpaViewModel
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
