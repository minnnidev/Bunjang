//
//  LoginResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/09/01.
//

import Foundation

struct LoginResponse: Decodable {
    var code: String
    var message: String
    var jwt: String
}
