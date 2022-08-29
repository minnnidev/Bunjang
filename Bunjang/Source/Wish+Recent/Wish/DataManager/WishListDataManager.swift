//
//  WishListDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import Foundation
import Alamofire

class WishListDataManager {
    func getData(page: Int, onCompletion: @escaping ([WishListResult]) -> Void) {
        let url = Constant.Base_URL + "/items/wish-lists?page=\(page)"
        
        AF.request(url, method: .get, headers: ["X-ACCESS-TOKEN": Secret.jwt])
            .validate().responseDecodable(of: WishListResponse.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data.result)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
