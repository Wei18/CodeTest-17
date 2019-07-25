//
//  SearchUserViewController.swift
//  17CodeTask
//
//  Created by ZhiWei Cao on 7/24/19.
//  Copyright © 2019 LS. All rights reserved.
//

import UIKit

class SearchUserViewController: UIViewController {
    
    var vm: SearchUserViewModel!
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private var flowLayout: UICollectionViewFlowLayout? {
        return collectionView.collectionViewLayout as? UICollectionViewFlowLayout
    }
    
    private lazy var searchController: UISearchController = {
        $0.searchResultsUpdater = self
        $0.dimsBackgroundDuringPresentation = false
        return $0
    }(UISearchController(searchResultsController: nil))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        collectionView.backgroundColor = .lightGray
        
        vm.delegate = self
        collectionView.register(.user)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        definesPresentationContext = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "lb_search_user_title".localized
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        
        let inset: CGFloat = 16
        flowLayout?.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout?.scrollDirection = .vertical
        flowLayout?.minimumLineSpacing = inset
        flowLayout?.minimumInteritemSpacing = inset
        flowLayout?.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        
        DispatchQueue.main.async {
            self.searchController.searchBar.becomeFirstResponder()
        }
    }
}

extension SearchUserViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return vm.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(.user, for: indexPath)
        let aCell = cell as? UserCollectionViewCell
        let itemData = vm.items[indexPath.item]
        aCell?.bind(itemData)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
        DispatchQueue(label: "fetch", qos: .utility).async {
            self.vm.loadMore(willDisplayItem: indexPath.item)
        }
    }
}

extension SearchUserViewController: SearchUserViewModelDelegate{
    func reload(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    func insert(from s: Int, to l: Int){
        let indexPaths = (s..<l).map { IndexPath(item: $0, section: 0) }
        collectionView.performBatchUpdates({ [weak self] in
            self?.collectionView.insertItems(at: indexPaths)
            }, completion: nil)
    }
}

extension SearchUserViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        DispatchQueue(label: "fetch", qos: .utility).async {
            self.vm.search(text: text)
        }
    }
}
