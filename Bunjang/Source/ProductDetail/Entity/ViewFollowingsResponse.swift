//
//  ViewFollowingsResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/09/01.
//

import Foundation

struct ViewFollowingsResponse: Decodable {
    let storeIdx: String
    let storeImage: String
    let followers, items: String
    let itemList: [FollowingItemList]
}


struct FollowingItemList: Decodable {
    let itemIdx: String
    let itemImage: String
    let price: String
}

typealias ViewFollowingsListResponse = [ViewFollowingsResponse]
