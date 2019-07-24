//
//  SearchUserViewController.swift
//  17CodeTask
//
//  Created by ZhiWei Cao on 7/24/19.
//  Copyright © 2019 LS. All rights reserved.
//

import UIKit

class SearchUserViewController: UICollectionViewController {
    
    var vm: SearchUserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension SearchUserViewController: SearchUserViewModelDelegate{
    func reloadView() {
        self.collectionView.reloadData()
    }
}
