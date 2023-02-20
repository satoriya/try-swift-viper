//
//  Protocols.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 20/02/23.
//

import Foundation
import UIKit

protocol TableViewProtocol {
    associatedtype TableView
    var tableView: TableView { get set }
    
    func registerTableView()
}

protocol TableViewCellContract {
    func registerUI()
    func setupConstraint()
}
