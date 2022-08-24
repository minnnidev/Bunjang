//
//  String.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import Foundation

extension String{
    func encodeUrl() -> String?{
        return self.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
    }
    func decodeUrl() -> String? {
        return self.removingPercentEncoding
    }
}

