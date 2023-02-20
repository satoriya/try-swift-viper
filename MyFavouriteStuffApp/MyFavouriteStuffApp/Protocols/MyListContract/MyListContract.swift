//
//  MyListContract.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 20/02/23.
//

import Foundation
import UIKit

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterListProtocol: AnyObject {
    var view: PresenterToViewListProtocol? { get set }
    var interactor: PresenterToInteractorListProtocol? { get set }
    var router: PresenterToRouterListProtocol? { get set }
    
    func viewDidLoad()
    func refresh()
    
    func numberOfRowsInsection() -> Int
    func getMyListData(indexPath: IndexPath) -> MyListModel?
    
    func didSelectRow(indexPath: IndexPath)
    func deselectRow(indexPath: IndexPath)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorListProtocol: AnyObject {
    var presenter: InteractorToPresenterListProtocol? {get set}
    
    func loadListDatas()
    func retrieveList(at index: Int )
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterListProtocol: AnyObject {
    func fetchListSuccess(list: [MyListModel])
    func fetchListFailure(errorCode: Int)
    
    func getQuoteSuccess(_ quote: MyListModel)
    func getQuoteFailure()
}

// MARK: View Output (Presenter -> View)
protocol PresenterToViewListProtocol: AnyObject {
    func onFetchSuccess()
    func onFetchQuotaFailure(error: String)
    
    func showLoad()
    func hideLoad()
    func deselectRow(at indexPath: IndexPath)
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterListProtocol: AnyObject {
    static func createModule() -> UINavigationController
    
    func pushToQuoteDetail(on view: PresenterToViewListProtocol, with list: MyListModel)
}
