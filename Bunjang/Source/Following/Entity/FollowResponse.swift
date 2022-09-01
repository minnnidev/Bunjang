//
//  FollowingResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/09/01.
//

import Foundation

struct postFollowResponse: Decodable {
    var code: String
    var message: String
}

struct patchFollowResponse: Decodable {
    var code: String
    var message: String
}
