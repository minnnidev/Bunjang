//
//  AddRequest.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/27.
//

import Foundation

struct AddRequest: Encodable {
    //이미지까지 추가
    var images: [String]
    var name: String
    var category: String
    var tags: [String]
    var price: Int
    var delivery: Int
    var stock: Int
    var isNew: Int
    var exchange: Int
    var content: String
    var safePay: Int
    var location: String
    var isAd: Int
    var inspection: Int
}
