//
//  Builder.swift
//  MyFavouriteStuffApp
//
//  Created by Phincon on 24/03/23.
//

import Foundation
import UIKit

struct ModuleBuilder {
    
    static func list() -> UIViewController {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyStuffDetailViewController") as? MyStuffDetailViewController else { return UIViewController() }
        let vm = ListViewModel(services: NetworkingService(), output: vc)
        return vc
    }
}
