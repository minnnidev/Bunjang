//
//  ViewStoreResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/25.
//

import Foundation

struct ViewStoreResponse: Decodable {
    let storeId, storeName: String
    let isCertificated: Bool
    let storeImage: String
    let rating, wishLists, reviews, followers: String
    let followings, soldCount, contactStart, contactEnd: String
    let precaution, policy, description, openDate: String
    let hit: String
    let itemsResponses: [ItemsResponse]
    let reviewsResponses: [ReviewsResponse]
    let inquiryResponses: [InquiryResponse]
}

struct InquiryResponse: Decodable {
    let name: String
    let image: String
    let post, date: String
}

struct ReviewsResponse: Decodable {
    let reviewerName: String
    let reviewerImage: String
    let post, rating, date: String
}
