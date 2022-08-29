//
//  BrandListDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import Foundation
import Alamofire

class BrandListDataManager {
    func getData(sort: String, page: Int, onCompletion: @escaping ([BrandListResult]) -> Void) {
        let url = Constant.Base_URL+"/items/brand?sort=\(sort)&page=\(page)"
        AF.request(url, method: .get, headers: ["X-ACCESS-TOKEN": Secret.jwt]).validate().responseDecodable(of: BrandListResponse.self) { response in
            switch response.result {
                case .success(let data):
                    onCompletion(data.result)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
