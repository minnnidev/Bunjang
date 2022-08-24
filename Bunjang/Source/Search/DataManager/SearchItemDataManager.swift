//
//  SearchItemDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit
import Alamofire

class SearchDataManager {
    func getData(name: String, sort: String, count: Int, OnCompletion: @escaping ([SearchItemResult])->Void) {
        let url = "https://makaroni.shop/item?name=\(name)&sort=\(sort)&count=\(count)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        AF.request(url, method: .get).validate().responseDecodable(of: SearchItemResponse.self) { response in
                switch response.result {
                    case .success(let data):
                        OnCompletion(data.result)
                    case .failure(let error):
                        print(error)
                }
        }
    }
}
