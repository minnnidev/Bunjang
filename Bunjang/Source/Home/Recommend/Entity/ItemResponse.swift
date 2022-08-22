//
//  ItemResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/22.
//

import UIKit

struct ItemResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Result
}

struct Result: Decodable {
    let price, name, location, time: String
    let hit, stock, wish, chat: Int
    let delivery, exchange: Bool
    let content, category: String
    let brand, seller: Int
    let status: String
    let tags: [String]
    let images: [String]
    let new: Bool
}
