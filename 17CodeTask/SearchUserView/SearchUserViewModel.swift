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
    var items: [User] { get set }
    func loadMore(willDisplayItem: Int)
    func search(text: String?)
    var delegate: SearchUserViewModelDelegate? { get set }
}
