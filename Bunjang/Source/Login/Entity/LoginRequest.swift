//
//  LoginRequest.swift
//  Bunjang
//
//  Created by 김민 on 2022/09/01.
//

import Foundation

struct LoginRequest: Encodable {
    var name: String
    var birthNumber: String
    var phoneNumber: String
    var isChecked: Bool
}
