//
//  LoginDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/09/01.
//

import Foundation
import Alamofire

class LoginDataManager {
    func postLogin(parameters: LoginRequest, onCompletion: @escaping (LoginResponse)->Void) {
        let url = Constant.Base_URL + "/login/sms"
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder())
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
