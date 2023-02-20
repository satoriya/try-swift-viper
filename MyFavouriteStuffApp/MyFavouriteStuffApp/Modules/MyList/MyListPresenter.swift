//
//  MyListPresenter.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 20/02/23.
//

import Foundation

class MyListPresenter: ViewToPresenterListProtocol {
    
    weak var view: PresenterToViewListProtocol?
    var interactor: PresenterToInteractorListProtocol?
    var router: PresenterToRouterListProtocol?
    
    var myListData: [MyListModel]?
    
    // load api data, show load view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        view?.showLoad()
        interactor?.loadListDatas()
    }
    
    // refresh data, when pull to refresh
    func refresh() {
        interactor?.loadListDatas()
    }
    
    // return number of rows
    func numberOfRowsInsection() -> Int {
        guard let data = myListData else { return 0 }
        return data.count
    }
    
    func getMyListData(indexPath: IndexPath) -> MyListModel? {
        guard let data = myListData else { return nil }
        
        return data[indexPath.row]
    }
    
    func didSelectRow(indexPath: IndexPath) {
        interactor?.retrieveList(at: indexPath.row)
    }
    
    func deselectRow(indexPath: IndexPath) {
        view?.deselectRow(at: indexPath)
    }
}

extension MyListPresenter: InteractorToPresenterListProtocol {
    func fetchListSuccess(list: [MyListModel]) {
        self.myListData?.append(contentsOf: list)
        view?.hideLoad()
        view?.onFetchSuccess()
    }
    
    func fetchListFailure(errorCode: Int) {
        view?.hideLoad()
        view?.onFetchQuotaFailure(error: "\(errorCode)")
    }
    
    func getQuoteSuccess(_ quote: MyListModel) {
        if let view = view {
            router?.pushToQuoteDetail(on: view, with: quote)
        }
    }
    
    func getQuoteFailure() {
        view?.hideLoad()
    }
    
    
}
