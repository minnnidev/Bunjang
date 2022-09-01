//
//  FollowDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/09/01.
//

import Foundation
import Alamofire

class FollowDataManager {
    func postFollow(storeIdx: String, onCompletion: @escaping (postFollowResponse) -> Void) {
        let url = Constant.Base_URL + "/follows/stores/\(storeIdx)"
        
        AF.request(url, method: .post, headers: ["X-ACCESS-TOKEN": Secret.jwt])
            .validate().responseDecodable(of: postFollowResponse.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func patchFollow(storeIdx: String, onCompletion: @escaping (patchFollowResponse)-> Void) {
        let url = Constant.Base_URL + "/follows/stores/\(storeIdx)"
        
        AF.request(url, method: .patch, headers: ["X-ACCESS-TOKEN": Secret.jwt])
            .validate().responseDecodable(of: patchFollowResponse.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
