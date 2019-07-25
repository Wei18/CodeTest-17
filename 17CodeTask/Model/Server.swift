//
//  Server.swift
//  17CodeTask
//
//  Created by ZhiWei Cao on 7/24/19.
//  Copyright © 2019 LS. All rights reserved.
//

import Foundation
import Alamofire

struct Response<C: Codable>: Codable{
    var totalCount: Int
    var incompleteResults: Bool
    var items: [C]
}

class Server{
    static let shared = Server()
    
    func searchUser(name: String, offset: Int, limit: Int = 20, result: @escaping ( ([User]) -> () ) ){
        let url = "https://api.github.com/search/users"
        let dict: [String : Any] = [
            "q": name,
            "page": max(offset/limit, 1),
            "per_page": limit]
        
        let r = Alamofire.request(url, method: .get, parameters: dict, encoding: URLEncoding.default, headers: nil)
        r.responseData { dr in
            guard let data = dr.data else {
                result([])
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try? decoder.decode(Response<User>.self, from: data)
            guard let users = response?.items else {
                result([])
                return }
            result(users)
        }
    }
}
