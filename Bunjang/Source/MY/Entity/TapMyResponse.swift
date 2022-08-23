//
//  TapMyResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/23.
//

import Foundation
import UIKit

struct TapMyResponse: Decodable {
    let storeId, storeName: String
    let isCertificated: Bool
    let storeImage: String
    let wishLists, reviews, followers, followings: String
    let itemsResponses: [ItemsResponse]
}

struct ItemsResponse: Decodable {
    let itemIdx, itemName, price, location: String
    let image: String
    let time: String
}
