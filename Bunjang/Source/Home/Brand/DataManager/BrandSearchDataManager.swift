//
//  BrandSearchDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import Foundation
import Alamofire

class BrandSearchDataManager {
    func getData(userIdx: Int, name: String, onCompletion: @escaping ([BrandListResult]) -> Void) {
        let url = Constant.Base_URL + "/items/brand/\(userIdx)?name=\(name)"
        let safeURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        AF.request(safeURL, method: .get).validate().responseDecodable(of: BrandListResponse.self) { response in
            switch response.result {
                case .success(let data):
                    onCompletion(data.result)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
