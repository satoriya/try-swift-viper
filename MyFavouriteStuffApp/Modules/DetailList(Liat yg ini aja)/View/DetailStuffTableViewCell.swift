//
//  DetailStuffTableViewCell.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 21/02/23.
//
//MARK: Abis dari MyStuffDetailViewController, bikin salah satu cell nya, contoh nya cell ini, dia dibikinnya programmatical

import UIKit

class DetailStuffTableViewCell: UITableViewCell {
    
    // ini identifier buat si cell, ga mandatory, yg penting pas nge register di controller, identifier nya sama
    static let id = "detailID"
    
    //MARK: Nambahin UI manual, pake private -> biar ga bisa di akses dari luar class / controller, pake lazy -> biar di kepanggil cuma pas kepake doang, ga ngabisin memory app
    private lazy var descLabel: UILabel = {
        let desc = UILabel()
        desc.text = "Harga :"
        desc.translatesAutoresizingMaskIntoConstraints = false
        return desc
    }()
    private lazy var valueLabel: UILabel = {
        let value = UILabel()
        value.text = "Rp. 50000"
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    //MARK: Add init, tambahin init jangan lupa, nanti function / method yg dibuat bisa ditaro disini
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        didSetupUI()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Setup UI
    //insert view ke dalem si cell
    private func didSetupUI() {
        self.addSubview(descLabel)
        self.addSubview(valueLabel)
        
        didSetConstraint()
    }
    
    // MARK: nambahin constraint ke view masing2
    private func didSetConstraint() {
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            descLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            valueLabel.leadingAnchor.constraint(equalTo: self.descLabel.trailingAnchor, constant: 8)
        ])
    }

}
