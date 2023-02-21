//
//  MyListFactory.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 20/02/23.
//

import Foundation

enum MyListFactory {
    static func build() -> MyListViewController {
        let interactor = MyListInteractor()
        let reouter = MyListRouter()
        let presenter = MyListPresenter(interactor: interactor, router: reouter)
        let viewController = MyListViewController(presenter: presenter)
        interactor.presenter = presenter
        presenter.view = viewController
        reouter.viewController = viewController
        return viewController
    }
}
