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
        let data = [
            MyListModel(imageSource: "Guguk", iconSource: "loveIcon", title: "Jam Kaki", date: generateDate(), price: 10000),
            MyListModel(imageSource: "Guguk", iconSource: "loveIcon", title: "Jam Kaki 1", date: generateDate(custom: true, time: 1277593000003), price: 30000),
            MyListModel(imageSource: "Guguk", iconSource: "loveIcon", title: "Gambar Anjing", date: generateDate(), price: 21000),
        ]
        
        let data1 = MyListModel(imageSource: "Guguk", iconSource: "loveIcon", title: "Jam Kaki", date: generateDate(), price: 10000)
        let data2 = MyListModel(imageSource: "Guguk", iconSource: "loveIcon", title: "Jam Kaki 1", date: generateDate(custom: true, time: 1277593000003), price: 30000)
        let data3 = MyListModel(imageSource: "Guguk", iconSource: "loveIcon", title: "Gambar Anjing", date: generateDate(), price: 21000)
    
        listFavData.append(contentsOf: data)
        listFavData.append(data1)
        listFavData.append(data2)
        listFavData.append(data3)
        
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
