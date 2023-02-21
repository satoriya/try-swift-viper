//
//  DescriptionStuffTableViewCell.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 21/02/23.
//MARK: Abis dari MyStuffDetailViewController, bikin salah satu cell nya, contoh nya cell ini, dia dibikin pake xib

import UIKit

class DescriptionStuffTableViewCell: UITableViewCell {

    // ini identifier buat si cell, ga mandatory, yg penting pas nge register di controller, identifier nya sama
    static let identifier = "descStuff"
    
    //MARK: Hasil narik outle dari xib
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "Jam Tangan"
        }
    }
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            priceLabel.text = "Rp 10.000"
        }
    }
    @IBOutlet weak var iconImage: UIImageView! {
        didSet {
            iconImage.image = UIImage(named: "loveIcon")
        }
    }
}
