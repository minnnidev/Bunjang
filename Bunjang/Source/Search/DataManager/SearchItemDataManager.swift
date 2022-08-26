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
        let url = Constant.Base_URL+"/items?name=\(name)&sort=\(sort)&count=\(count)"
        let safeURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        AF.request(safeURL, method: .get).validate().responseDecodable(of: SearchItemResponse.self) { response in
                switch response.result {
                    case .success(let data):
                        OnCompletion(data.result)
                    case .failure(let error):
                        print(error)
                }
        }
    }
}
