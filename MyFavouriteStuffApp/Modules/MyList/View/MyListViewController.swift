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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

extension MyListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyListTableViewCell", for: indexPath) as? MyListTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}

extension MyListViewController:  UITableViewDelegate {}
