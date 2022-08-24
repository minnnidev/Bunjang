//
//  SignInRequest.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import Foundation

struct SignInRequest: Encodable {
    var loginId: String
    var password: String
    var storeName: String?
}
