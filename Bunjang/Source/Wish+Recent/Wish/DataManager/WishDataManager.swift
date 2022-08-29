//
//  WishAddDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import Foundation
import Alamofire

class WishDataManager {
    func postWish(parameters: WishAddRequest, onCompletion: @escaping (Bool) -> Void) {
        let url = Constant.Base_URL + "/items/wish-lists"
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: ["X-ACCESS-TOKEN": Secret.jwt])
            .validate().responseDecodable(of: WishResponse.self) { response in
                switch response.result {
                    case .success(let data):
                        onCompletion(true)
                        print("성공")
                    case .failure(let error):
                        print(error)
                }
            }
    }
    
    func deleteWish(itemIdx: Int, onCompletion: @escaping (Bool) -> Void) {
        let url = Constant.Base_URL + "/items/wish-lists?itemIdx=\(itemIdx)"
        
        AF.request(url, method: .delete, headers: ["X-ACCESS-TOKEN": Secret.jwt])
            .validate().responseDecodable(of: WishResponse.self) { response in
                switch response.result {
                    case .success(let data):
                        onCompletion(true)
                    case .failure(let error):
                        print(error)
                    }
        }
    }
}

/*
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
 */
