//
//  SMSPostDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import UIKit
import Alamofire

class SMSPostDataManager {
    func SMSPost(parameters: SMSPostRequest, onCompletion: @escaping (Bool)-> Void) {
        let url = Constant.Base_URL + "/login/sms/auth"
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate().responseDecodable(of: SMSPostResponse.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(true)
                    print("문자 발송 완료")
                case .failure(let error):
                    print(error)
            }
        }
    }
}
