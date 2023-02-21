//
//  Extensions.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 20/02/23.
//

import Foundation
import UIKit

extension UIView {
    
    func cardView(cornerRadius: CGFloat, opacity: Float, offset: CGSize) {
        let layers = self.layer
        layers.cornerRadius = cornerRadius
        layers.shadowOpacity = opacity
        layers.shadowOffset = offset
    }
}

extension MyListInteractor {
    func generateDate(custom: Bool = false, time: Double = 0) -> String {
        var currentDateTime = Date()
        if custom {
            currentDateTime = Date(timeIntervalSince1970: (time / 1000))
        }
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        
        let dates = formatter.string(from: currentDateTime)
        return dates
    }
}
