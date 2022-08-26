//
//  BrandListDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import Foundation
import Alamofire

class BrandListDataManager {
    func getData(userIdx: Int, sort: String, onCompletion: @escaping ([BrandListResult]) -> Void) {
        let url = Constant.Base_URL+"/items/brand/\(userIdx)?sort=\(sort)"
        AF.request(url, method: .get).validate().responseDecodable(of: BrandListResponse.self) { response in
            switch response.result {
                case .success(let data):
                    onCompletion(data.result)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
