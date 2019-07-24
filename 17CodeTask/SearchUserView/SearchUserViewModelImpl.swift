//
//  SearchUserViewModelImpl.swift
//  17CodeTask
//
//  Created by ZhiWei Cao on 7/24/19.
//  Copyright © 2019 LS. All rights reserved.
//

import Foundation

class SearchUserViewModelImpl: SearchUserViewModel{
    var items: [Any] = []
    
    func pullToRefresh() {
        delegate?.reloadView()
    }
    
    func loadMore() {
        
    }
    
    func search(text: String) {
        delegate?.reloadView()
    }
    
    weak var delegate: SearchUserViewModelDelegate?
    
    let server = Server.shared
    
}
