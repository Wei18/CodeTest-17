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
    
    private let cellId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
        collectionView.register(.user)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return vm.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(.user, for: indexPath)
        let aCell = cell as? UserCollectionViewCell
        let itemData = vm.items[indexPath.item]
        aCell?.bind(itemData)
        return cell
    }

    
}

extension SearchUserViewController: SearchUserViewModelDelegate{
    func reloadView() {
        self.collectionView.reloadData()
    }
}
