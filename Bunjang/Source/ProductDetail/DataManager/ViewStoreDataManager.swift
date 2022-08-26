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
        let url = Constant.Base_URL+"/users/stores/\(userIdx)"
        AF.request(url, method: .get)
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
