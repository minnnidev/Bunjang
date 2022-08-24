//
//  SearchItemResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import Foundation
import UIKit

struct SearchItemResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SearchItemResult]
}

struct SearchItemResult: Decodable {
    let itemIdx, price, name: String
    let safePay: Bool
    let image: String
    let status: String
    let ad: Bool
}
