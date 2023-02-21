//
//  MyListRouter.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 20/02/23.
//

import Foundation
import UIKit

class MyListRouter: PresenterToRouterListProtocol {
    var viewController: UIViewController?
    
    //Setup for router
    func pushToQuoteDetail(on view: PresenterToViewListProtocol, with list: MyListModel) {
        print("meanwhile, no action")
    }
}
