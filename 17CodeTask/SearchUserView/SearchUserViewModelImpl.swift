//
//  SearchUserViewModelImpl.swift
//  17CodeTask
//
//  Created by ZhiWei Cao on 7/24/19.
//  Copyright © 2019 LS. All rights reserved.
//

import Foundation

class SearchUserViewModelImpl: SearchUserViewModel{
    var items: [User] = []
    
    weak var delegate: SearchUserViewModelDelegate?
    
    private let server = Server.shared
    
    private var isNotLoading = true
    
    private var currentSearchingName: String?
    
    func loadMore(willDisplayItem item: Int) {
        guard (item + 10) > items.count, items.count > 0 else { return }
        fetch(offset: items.count)
    }
    
    func search(text: String?) {
        currentSearchingName = text
        fetch(offset: 0)
    }
    
    private func fetch(offset: Int) {
        guard isNotLoading, let name = currentSearchingName else { return }
        isNotLoading = false
        server.searchUser(name: name, offset: offset) { [weak self] (users) in
            if offset == 0 {
                self?.items = users
            }else{
                self?.items += users
            }
            self?.delegate?.reloadView()
            self?.isNotLoading = true
        }
    }
}
