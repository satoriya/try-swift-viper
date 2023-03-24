//
//  MyListInteractor.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 20/02/23.
//
// MARK: Better start from this class first, because this is where the logic came from

import Foundation

class MyListInteractor: PresenterToInteractorListProtocol {
    weak var presenter: InteractorToPresenterListProtocol?
    var listFavData = [MyListModel]()
    
    func loadListDatas() {
        // create the stub data

        self.presenter?.fetchListSuccess(list: listFavData)
    }
    
    func retrieveList(at index: Int) {
//        guard let listFavData = listFavData else {
//            presenter?.getQuoteFailure()
//            return
//        }
//
        self.presenter?.getQuoteSuccess(listFavData[index])
    }
}
