//
//  ReviewResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import Foundation

// MARK: - WelcomeElement
struct ReviewResponse: Decodable {
    let sellerName, reviewerIdx, reviewerName: String
    let reviewerImage: String
    let purchasedProduct, rating, reviewPost, reviewDate: String
    let comments: Comments
}

// MARK: - Comments
struct Comments: Decodable {
    let sellerName, sellerPost, sellerDate: String
}
