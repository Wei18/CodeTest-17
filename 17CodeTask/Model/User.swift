//
//  User.swift
//  17CodeTask
//
//  Created by ZhiWei Cao on 7/24/19.
//  Copyright © 2019 LS. All rights reserved.
//

import Foundation

struct User: Codable{
    var login: String //"mojombo",
    var id: Int //1,
    var nodeId: String //"MDQ6VXNlcjE=",
    var avatarUrl: String //"https://avatars0.githubusercontent.com/u/1?v=4",
    var gravatarId: String //"",
    var url: String //"https://api.github.com/users/mojombo",
    var htmlUrl: String //"https://github.com/mojombo",
    var followersUrl: String //"https://api.github.com/users/mojombo/followers",
    var followingUrl: String //"https://api.github.com/users/mojombo/following{/other_user}",
    var gistsUrl: String //"https://api.github.com/users/mojombo/gists{/gist_id}",
    var starredUrl: String //"https://api.github.com/users/mojombo/starred{/owner}{/repo}",
    var subscriptionsUrl: String //"https://api.github.com/users/mojombo/subscriptions",
    var organizationsUrl: String //"https://api.github.com/users/mojombo/orgs",
    var reposUrl: String //"https://api.github.com/users/mojombo/repos",
    var eventsUrl: String //"https://api.github.com/users/mojombo/events{/privacy}",
    var receivedEventsUrl: String //"https://api.github.com/users/mojombo/received_events",
    var type: String //"User",
    var siteAdmin: Bool //false,
    var score: Double //97.806404
}
