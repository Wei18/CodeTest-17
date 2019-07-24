//
//  ViewControllerFactory.swift
//  17CodeTask
//
//  Created by ZhiWei Cao on 7/24/19.
//  Copyright © 2019 LS. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerFactory{
    static let shared = ViewControllerFactory()
    
    func getSearchUserVC() -> UIViewController{
        let nav = UINavigationController()
        let vc = SearchUserViewController()
        vc.vm = SearchUserViewModelImpl()
        nav.pushViewController(vc, animated: false)
        return nav
    }
}
