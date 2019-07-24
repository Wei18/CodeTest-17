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
    
    private lazy var searchController: UISearchController = {
        $0.searchResultsUpdater = self
        $0.dimsBackgroundDuringPresentation = false
        return $0
    }(UISearchController(searchResultsController: nil))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
        collectionView.register(.user)
        
        definesPresentationContext = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
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

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
        vm.loadMore(willDisplayItem: indexPath.item)
    }
}

extension SearchUserViewController: SearchUserViewModelDelegate{
    func reloadView() {
        collectionView.reloadData()
    }
}

extension SearchUserViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        vm.search(text: text)
    }
}
