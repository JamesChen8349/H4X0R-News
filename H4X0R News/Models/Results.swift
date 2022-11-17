//
//  Results.swift
//  H4X0R News
//
//  Created by JamesChen on 2022/11/15.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String? //設定為optinal因為回傳的url value可能為null，所以這邊要設定？允許null
}
