//
//  Classes.swift
//  SwiftAndradeTDA
//
//  Created by Felipe Andrade on 11/07/21.
//

import UIKit

protocol ViewModelDelegate: AnyObject {
    func setado()
}

class OpaViewModel: TDAViewModel {
    weak var viewDelegate: ViewModelDelegate?
    //var service = ServiceMain()
}

class TesteViewModel: TDAViewModel {
    typealias Model = Empty
    
    weak var viewDelegate: ViewModelDelegate?
}

class OpaViewController: BaseViewController, TDAViewController  {
    typealias SetViewModel = OpaViewModel
    var tableView: UITableView! = UITableView()
    var viewModel: OpaViewModel
    
    required init(_ viewModel: OpaViewModel) {
        self.viewModel = viewModel
        super.init()
        setup()
    }
    
    func setup() {
        viewModel.viewDelegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension OpaViewController: ViewModelDelegate, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func setado() { }
}

struct Empty: Codable {}


class MyViewModel: TDAViewModel {
    weak var viewDelegate: ViewModelDelegate?
    weak var coordinatorDelegate: Coordinator?

}
