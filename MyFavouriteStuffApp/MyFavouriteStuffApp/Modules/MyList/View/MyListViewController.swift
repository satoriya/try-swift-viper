//
//  ViewController.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 20/02/23.
//

import UIKit

class MyListViewController: UIViewController, TableViewProtocol {
    
    lazy var tableView: UITableView = {
        let tab = UITableView()
        tab.dataSource = self
        tab.delegate = self
        tab.translatesAutoresizingMaskIntoConstraints = false
        return tab
    }()
    
    var presenter: ViewToPresenterListProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        registerTableView()
    }

    func registerTableView() {
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        self.tableView.register(MyListTableViewCell.self, forCellReuseIdentifier: "MyListTableViewCell")
    }
}

extension MyListViewController: PresenterToViewListProtocol{
    func onFetchSuccess() {
        self.tableView.reloadData()
    }
    
    func onFetchQuotaFailure(error: String) {
        
    }
    
    func showLoad() {
        print("start loading")
    }
    
    func hideLoad() {
        print("stop loading")
    }
    
    func deselectRow(at indexPath: IndexPath) {
        self.tableView.deselectRow(at: IndexPath(row: indexPath.row, section: 0), animated: true)
    }
    
    
}

extension MyListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInsection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyListTableViewCell", for: indexPath) as? MyListTableViewCell else { return UITableViewCell() }
        if let model = presenter?.getMyListData(indexPath: indexPath) {
            cell.setCellValue(model: model)
        }
        
        return cell
    }
    
    
}

extension MyListViewController:  UITableViewDelegate {}
