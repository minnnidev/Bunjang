//
//  InquiryDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import Foundation
import Alamofire

class InquiryAddDataManager {
    func postInquiry(userIdx: String, storeIdx: String, parameters: InquiryAddRequest, onCompletion: @escaping (Bool) -> Void) {
        let url = Constant.Base_URL + "/users/\(userIdx)/inquiries/\(storeIdx)"
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate().responseDecodable(of: InquiryAddResponse.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(true)
                    print("성공")
                case .failure(let error):
                    print(error)
            }
        }
    }
}

