//
//  MyStuffDetailViewController.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 21/02/23.
//
// MARK: DImulai dari sini
// dari design figma yg Moystuffsmr

import UIKit

// ini enum untuk nge bedain setiap section
fileprivate enum DetailStuff: Int {
    case description
    case detail
    
    init(index: Int) {
        switch index {
        case 0:
            self = .description
        case 1:
            self = .detail
        default:
            self = .detail
        }
    }
}

// jangan lupa di exten, si UITableViewDelegate sama UITableViewDataSource, kalo ada error tinggal di add aja protocol nya
class MyStuffDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 1. Tarik outle dari tableview nya MyStuffStoryboard, ambil controller MyStuffDetailViewController
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageTitle: UIImageView! {
        didSet {
            // ini untuk default image nya aja, ga mandatory
            imageTitle.image = UIImage(named: "guguk")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ini untuk delegate sama data source nya tableview
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
        // tableview cell with xib
        let detailNib = UINib(nibName: "DescriptionStuffTableViewCell", bundle: nil)
        self.tableView.register(detailNib, forCellReuseIdentifier: DescriptionStuffTableViewCell.identifier)
        
        // Programmatical tableview cel
        self.tableView.register(DetailStuffTableViewCell.self, forCellReuseIdentifier: DetailStuffTableViewCell.id)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // enum nya di panggil disini, diisi indexpath.section (karena dia punya indexpath
        let section = DetailStuff(index: indexPath.section)
        switch section {
            // ini section nya si description
            // yg ada jam tangan sama harga
        case .description:
            guard let descriptionCell = tableView.dequeueReusableCell(withIdentifier: DescriptionStuffTableViewCell.identifier, for: indexPath) as? DescriptionStuffTableViewCell else {
                return UITableViewCell()
            }
            
            return descriptionCell
        case .detail:
            /*
             ini section nya si detail product,
             yg ada Stock   : 20
             */
            guard let detailCell = tableView.dequeueReusableCell(withIdentifier: DetailStuffTableViewCell.id, for: indexPath) as? DetailStuffTableViewCell else {
                return UITableViewCell()
            }
            
            return detailCell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // number of section tergantung sama mau nongolin berapa banyak cell
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // enum nya di panggil disini, diisi indexpath.section (karena dia punya section)
        
        let section = DetailStuff(index: section)
        switch section {
        case .description:
            return 1
        case .detail:
            return 4
        }
        
    }
    
}
