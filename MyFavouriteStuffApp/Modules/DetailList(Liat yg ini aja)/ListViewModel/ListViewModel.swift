//
//  ListViewModel.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 24/03/23.
//

import Foundation

protocol ListVMProtocolInput {
    func viewDidLoad()
    func viewDidAppear()
    func fetchData()
}

protocol ListVMProtocolOutput {
    func set(viewModel: ListVMProtocolInput)
    func reloadTableView()
    func showData(data: [ListModel])
    func showError(error: Error)
}

class ListViewModel {
    var services: NetworkingProtocol
    var data: [ListModel] = []
    private var output: ListVMProtocolOutput?
    
    init(services: NetworkingProtocol, output: ListVMProtocolOutput) {
        self.services = services
        self.output = output
    }
}

extension ListViewModel: ListVMProtocolInput {
    func viewDidLoad() {
        fetchData()
    }
    
    func viewDidAppear() {}
    
    func fetchData() {
        let url = Constant.baseUrl + Endpoint.products.rawValue
        guard let url = URL(string: url) else { return }
        self.services.callApi(url: url, model: [ListModel].self) { [unowned self] responses in
            switch responses {
            case .success(let data):
                self.data.append(contentsOf: data)
                self.output?.showData(data: self.data)
                self.output?.reloadTableView()
            case .failure(let error):
                self.output?.showError(error: error)
                self.output?.reloadTableView()
            }
        }
    }
}
