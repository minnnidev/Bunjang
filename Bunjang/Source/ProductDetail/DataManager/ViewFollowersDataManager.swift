//
//  ViewFollowersDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import Foundation
import Alamofire

class ViewFollowersDataManager {
    func getData(userIdx: String, onCompletion: @escaping (ViewFollowersListResponse) -> Void) {
        let url = Constant.Base_URL + "/follows/followers/users/\(userIdx)"
        
        AF.request(url, method: .get, headers: ["X-ACCESS-TOKEN": Secret.jwt]).validate().responseDecodable(of: ViewFollowersListResponse.self) { response in
            switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error)
            }
        }
    }
    
}
