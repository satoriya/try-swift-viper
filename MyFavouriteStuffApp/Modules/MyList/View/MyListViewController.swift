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
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterListProtocol?
    
    init(presenter: ViewToPresenterListProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        registerTableView()
        
        self.navigationItem.title = "My Favourite Stuff"
        self.view.backgroundColor = .white
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
        self.tableView.refreshControl = refreshControl
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

extension MyListViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "MyStuffStoryboard", bundle:nil)
        if let detail = storyBoard.instantiateViewController(withIdentifier: "MyStuffDetailViewController") as? MyStuffDetailViewController {
            self.navigationController?.pushViewController(detail, animated: true)
        }
        
    }
    
}
