//
//  KakaoLoginDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/09/01.
//

import Foundation
import Alamofire

class kakaoLoginDataManager {
    func getData(token: String, onCompletion: @escaping (LoginResponse) -> Void) {
        let url = Constant.Base_URL + "/login/kakao/auth?token=\(token)"
        
        AF.request(url, method: .get)
            .validate().responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                    case .success(let data):
                        onCompletion(data)
                    case .failure(let error):
                        print(error)
                }
            }
    }
}
