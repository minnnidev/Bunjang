//
//  SignInDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit
import Alamofire

class SignInDataManager {
    func postData(parameters: SignInRequest) {
        AF.request("https://makaroni.shop/users", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil).validate().responseDecodable(of: SignInResponse.self) { response in
            switch response.result {
                case .success(let data):
                    print("회원가입 성공")
                
                //오류처리
                case .failure(let error):
                    print(error)
            }
        }
    }
}
