//
//  RecentItemResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import Foundation

struct RecentItemResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [RecentItemResult]
}


struct RecentItemResult: Decodable {
    let itemIdx, price, name: String
    let safePay: Bool
    let createdAt: String
    let image: String
    let ad: Bool
}
