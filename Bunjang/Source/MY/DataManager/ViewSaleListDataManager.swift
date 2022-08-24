//
//  ViewSaleListDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/25.
//

import Foundation
import Alamofire

class ViewSaleListDataManager {
    func getData(userIdx: Int, condition: String, onCompletion: @escaping (ViewSaleListResponse)->Void) {
        AF.request("https://makaroni.shop/users/\(userIdx)/items?condition=\(condition)&start=0&offset=10&sortCond=DESC", method: .get)
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
