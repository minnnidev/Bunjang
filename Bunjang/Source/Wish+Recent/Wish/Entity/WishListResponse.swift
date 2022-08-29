//
//  WishListResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import Foundation

struct WishListResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [WishListResult]
}

// MARK: - Result
struct WishListResult: Decodable {
    let itemIdx: String
    let image: String
    let name, price, safePay: String
    let storeName: String
    let storeImg, updatedAt: String
}


