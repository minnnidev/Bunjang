//
//  TapMyDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/23.
//

import Foundation
import Alamofire

class TapMyDataManager {
    func sendData(userIdx: Int, onCompletion: @escaping (TapMyResponse) -> Void) {
        AF.request("https://makaroni.shop/users", method: .get, headers: ["X-ACCESS-TOKEN": Secret.jwt]).validate().responseDecodable(of: TapMyResponse.self) { response in
            switch response.result {
            case .success(let data):
                onCompletion(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
