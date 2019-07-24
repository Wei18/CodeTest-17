//
//  SearchUserViewModel.swift
//  17CodeTask
//
//  Created by ZhiWei Cao on 7/24/19.
//  Copyright © 2019 LS. All rights reserved.
//

import Foundation

protocol SearchUserViewModelDelegate: class{
    func reloadView()
}

protocol SearchUserViewModel{
    var items: [Any] { get set }
    func pullToRefresh()
    func loadMore()
    func search(text: String)
    var delegate: SearchUserViewModelDelegate? { get set }
}
