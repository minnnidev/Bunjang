//
//  FollowingBrandResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import Foundation

struct FollowingBrandResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [FollowingBrandResult]
}

// MARK: - Result
struct FollowingBrandResult: Decodable {
    let logo: String
    let brandIdx, brandName, englishName, itemCnt: String
}
