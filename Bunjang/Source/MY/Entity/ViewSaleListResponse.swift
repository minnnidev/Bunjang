//
//  ViewSaleListResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/25.
//

import Foundation

struct ViewSaleResponse: Decodable {
    let itemIdx, itemName, price, location: String
    let image: String
    let time: String
}

typealias ViewSaleListResponse = [ViewSaleResponse]
