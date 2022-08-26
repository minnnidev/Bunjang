//
//  BrandListResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import Foundation

struct BrandListResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [BrandListResult]
}


struct BrandListResult: Decodable {
    let logo: String
    let brandIdx, brandName, englishName, itemCnt: String
    let follow: Bool
}
