//
//  BrandSearchDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import Foundation
import Alamofire

class BrandSearchDataManager {
    func getData(name: String, page: Int, onCompletion: @escaping ([BrandListResult]) -> Void) {
        let url = Constant.Base_URL + "/items/brand/search?name=\(name)&page=\(page)"
        let safeURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        AF.request(safeURL, method: .get, headers: ["X-ACCESS-TOKEN": Secret.jwt]).validate().responseDecodable(of: BrandListResponse.self) { response in
            switch response.result {
                case .success(let data):
                    onCompletion(data.result)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
