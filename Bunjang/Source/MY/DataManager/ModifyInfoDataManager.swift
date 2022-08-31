//
//  ModifyInfoDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import Foundation
import Alamofire

class ModifyInfoDataManager {
    func patchInfoString(userIdx: Int, parameters: [String: String], onCompletion: @escaping (Bool)->Void) {
        let url = Constant.Base_URL+"/users/\(userIdx)"
        
        AF.request(url, method: .patch, parameters: parameters, encoder: JSONParameterEncoder(), headers: ["X-ACCESS-TOKEN": Secret.jwt])
            .validate().responseDecodable(of: ModifyInfoResponse.self) { response in
                switch response.result {
                    case .success(let data):
                        onCompletion(true)
                    case .failure(let error):
                        print(error)
                }
            }
    }
}
