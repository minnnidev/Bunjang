//
//  AddResponse.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/27.
//

import Foundation

struct AddResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: AddItemResult
}

struct AddItemResult: Decodable {
    var idx: Int
}
