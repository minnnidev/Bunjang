//
//  ItemResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/22.
//

import UIKit

// MARK: - ViewItemResponse
struct ViewItemResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Result]
}

// MARK: - Result
struct Result: Decodable {
    let idx, price, name, location: String
    let time, hit, stock, wish: String
    let chat: String
    let delivery, exchange: Bool
    let content, category, brand, seller: String
    let status: String
    let tags: [String]
    let images: [String]
    let new: Bool
}
