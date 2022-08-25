//
//  EachItemDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/25.
//

import Foundation
import Alamofire

class EachItemDataManager {
    func getData(itemIdx: String, onCompletion: @escaping (EachItemResponse)->Void) {
        AF.request("https://makaroni.shop/items/\(itemIdx)", method: .get)
            .validate().responseDecodable(of: EachItemResponse.self) { response in
                switch response.result {
                    case .success(let data):
                        onCompletion(data)
                    case .failure(let error):
                        print(error)
                }
            }
    }
}
