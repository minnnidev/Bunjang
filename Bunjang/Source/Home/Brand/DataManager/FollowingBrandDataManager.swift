//
//  FollowingBrandDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import Foundation
import Alamofire

class FollowingBrandDataManager {
    func getData(userIdx: Int, sort: String, onCompletion: @escaping ([FollowingBrandResult]) -> Void) {
        let url = Constant.Base_URL+"/items/brand/follow/\(userIdx)?sort=\(sort)"
        
        AF.request(url, method: .get).validate().responseDecodable(of: FollowingBrandResponse.self) { response in
            switch response.result {
                case .success(let data):
                onCompletion(data.result)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
