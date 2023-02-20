//
//  MyListRouter.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 20/02/23.
//

import Foundation
import UIKit

class MyListRouter: PresenterToRouterListProtocol {
    
    //Setup for router
    static func createModule() -> UINavigationController {
        let vc = MyListViewController()
        let navigationController = UINavigationController(rootViewController: vc)

        return navigationController
    }
    
    func pushToQuoteDetail(on view: PresenterToViewListProtocol, with list: MyListModel) {
        print("meanwhile, no action")
    }
}
