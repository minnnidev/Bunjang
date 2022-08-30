//
//  WishResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/30.
//

import Foundation

struct WishResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: WishResult
}

struct WishResult: Decodable {
    var itemIdx: String
}
