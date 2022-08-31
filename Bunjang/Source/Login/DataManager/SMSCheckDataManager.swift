//
//  SMSCheckDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import Foundation
import Alamofire

class SMSCheckDataManager {
    func getData(authNumber: String, onCompletion: @escaping (SMSCheckResponse)->Void) {
        let url = Constant.Base_URL + "/login/sms?authNumber=\(authNumber)"
        
        AF.request(url, method: .get).validate().responseDecodable(of: SMSCheckResponse.self) { response in
            switch response.result {
            case .success(let data):
                onCompletion(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
