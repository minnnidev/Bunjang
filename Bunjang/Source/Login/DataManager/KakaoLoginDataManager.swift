//
//  KakaoLoginDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/28.
//

import Foundation
import Alamofire

class KakaoLoginDataManager {
    func getKakaoLogin(onCompletion: @escaping (KakaoLoginResponse) -> Void) {
        
        let url = "https://kauth.kakao.com/oauth/authorize?client_id=8e89ed1c355979f20e667f26fd926191&redirect_uri=https://makaroni.shop/login/kakao&response_type=code"
          
        AF.request(url, method: .get)
            .validate().responseDecodable(of: KakaoLoginResponse.self)  { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
