//
//  ViewStoreDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/25.
//

import Foundation
import Alamofire

class ViewStoreDataManager {
    func getData(userIdx: String, onCompletion: @escaping (ViewStoreResponse)->Void) {
        AF.request("https://makaroni.shop/users/stores/\(userIdx)", method: .get)
            .validate().responseDecodable(of: ViewStoreResponse.self) { response in
                switch response.result {
                    case .success(let data):
                        onCompletion(data)
                    case .failure(let error):
                        print(error)
                }
        }
    }
}
