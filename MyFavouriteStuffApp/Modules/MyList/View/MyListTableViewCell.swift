//
//  MyListTableViewCell.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 20/02/23.
//

import UIKit

class MyListTableViewCell: UITableViewCell {
    
    fileprivate lazy var imageIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "guguk")
        return img
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Jam Kaki"
        return lb
    }()
    
    fileprivate lazy var priceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Rp 100.000"
        return lb
    }()
    
    fileprivate lazy var dateLabel: UILabel = {
        let lb = UILabel()
        lb.text = "17 Agustus 2022"
        return lb
    }()
    
    fileprivate lazy var smallCornerIcon: UIImageView = UIImageView()
    
    fileprivate lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.cardView(cornerRadius: 0, opacity: 1, offset: CGSize(width: 1, height: 1))
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        registerUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        registerUI()
    }

}

extension MyListTableViewCell: TableViewCellContract {
    
    func registerUI() {
        let v = bgView
        self.addSubview(v)
        v.addSubview(imageIcon)
        v.addSubview(titleLabel)
        v.addSubview(priceLabel)
        v.addSubview(dateLabel)
        v.addSubview(smallCornerIcon)
        
        v.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        smallCornerIcon.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraint()
    }
    
    func setupConstraint() {
        let v = bgView
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
        ])

        NSLayoutConstraint.activate([
            self.imageIcon.topAnchor.constraint(equalTo: v.topAnchor),
            self.imageIcon.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            self.imageIcon.bottomAnchor.constraint(equalTo: v.bottomAnchor),
            self.imageIcon.heightAnchor.constraint(equalToConstant: 105),
            self.imageIcon.widthAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: v.topAnchor, constant: 8),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.imageIcon.trailingAnchor, constant: 8),
        ])

        NSLayoutConstraint.activate([
            self.priceLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.imageIcon.trailingAnchor, constant: 8)
        ])

        NSLayoutConstraint.activate([
            self.priceLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.imageIcon.trailingAnchor, constant: 8)
        ])

        NSLayoutConstraint.activate([
            self.dateLabel.topAnchor.constraint(equalTo: v.topAnchor, constant: 8),
            self.dateLabel.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            self.smallCornerIcon.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 8),
            self.smallCornerIcon.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -8),
        ])
        
    }
}




