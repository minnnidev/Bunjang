//
//  ViewFollowingsDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/09/01.
//

import Foundation
import Alamofire

class ViewFollowingsDataManager {
    func getData(userIdx: String, onCompletion: @escaping (ViewFollowingsListResponse)->Void) {
        let url = Constant.Base_URL + "/follows/followings/users/\(userIdx)"
        
        AF.request(url, method: .get, headers: ["X-ACCESS-TOKEN": Secret.jwt])
            .validate().responseDecodable(of: ViewFollowingsListResponse.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
