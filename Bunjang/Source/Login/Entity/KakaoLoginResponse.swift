//
//  KakaoLoginResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/28.
//

import Foundation

struct KakaoLoginResponse: Decodable {
    var code: String?
    var message: String?
    var jwt: String?
}
