//
//  ListModel.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 24/03/23.
//

import Foundation

struct ListModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
    let rating: Rating
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

