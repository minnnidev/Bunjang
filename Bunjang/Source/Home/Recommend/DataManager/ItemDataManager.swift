//
//  ItemDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/22.
//

import Foundation
import Alamofire

class ItemDataManager {
    func getData(page: Int, onCompletion: @escaping (Result) -> Void) {
        AF.request("https://makaroni.shop/item/\(page)", method: .get).validate().responseDecodable(of: ItemResponse.self) { response in
            switch response.result {
            case .success(let data):
                onCompletion(data.result)
            case .failure(let error):
                print(error)
            }
        }
    }
}
