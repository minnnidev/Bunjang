//
//  ViewSaleListDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/25.
//

import Foundation
import Alamofire

class ViewSaleListDataManager {
    func getData(condition: String, onCompletion: @escaping (ViewSaleListResponse)->Void) {
        AF.request("https://makaroni.shop/users/items?condition=\(condition)&start=0&offset=10&sortCond=DESC", method: .get, headers: ["X-ACCESS-TOKEN": Secret.jwt])
            .validate()
            .responseDecodable(of: ViewSaleListResponse.self) { response in
                switch response.result {
                    case .success(let data):
                        onCompletion(data)
                    case .failure(let error):
                        print(error)
                }
            }
        
    }
}
