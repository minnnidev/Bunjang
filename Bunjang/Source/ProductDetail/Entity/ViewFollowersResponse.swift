//
//  ViewFollowersResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import Foundation

struct ViewFollowersResponse: Decodable {
    let storeIdx, storeName: String
    let storeImage: String
    let followers, items: String
}

typealias ViewFollowersListResponse = [ViewFollowersResponse]
