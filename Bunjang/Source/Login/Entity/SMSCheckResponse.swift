//
//  SMSCheckResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import Foundation

struct SMSCheckResponse: Decodable {
    var code: String
    var message: String
    var check: Bool
}
