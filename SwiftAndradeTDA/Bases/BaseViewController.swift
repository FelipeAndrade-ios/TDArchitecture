//
//  BaseViewController.swift
//  SwiftAndradeTDA
//
//  Created by Felipe Andrade on 11/07/21.
//

import UIKit

class BaseViewController: UIViewController {
    init() {
        super.init(nibName: String(describing: type(of: self)),
                   bundle: Bundle(for: type(of: self)))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//class Base2ViewController<T: TDAViewModel>: UIViewController {
//    typealias SetViewModel = T
//
//    var viewModel: T
//
//    required init(_ viewModel: T) {
//        self.viewModel = viewModel
//
//    }
//
//    init() {
//        super.init(nibName: String(describing: type(of: self)),
//                   bundle: Bundle(for: type(of: self)))
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

//
//protocol BaseViewControllerProtocol: TDAViewController where Self: UIViewController {
//
//}
//
//
//
//
//
//class BrenoViewController: BaseViewController<BrenoViewModel> {
//
//
//}
//
//protocol TesteFDelegate: AnyObject {
//
//}
//
//class BrenoViewModel: TDAViewModel {
//    var viewDelegate: TesteFDelegate?
//}
//
//
//let classe = BrenoViewController(BrenoViewModel())
////classe.viewModel
