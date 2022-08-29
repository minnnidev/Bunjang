//
//  RecentItemDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import Foundation
import Alamofire

class RecentItemDataManager {
    func getData(onCompletion: @escaping ([RecentItemResult])->Void) {
        let url = Constant.Base_URL+"/items/last?page=1"
        AF.request(url, method: .get, headers: ["X-ACCESS-TOKEN": Secret.jwt]).validate().responseDecodable(of: RecentItemResponse.self) { response in
            switch response.result {
                case .success(let data):
                    onCompletion(data.result)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
