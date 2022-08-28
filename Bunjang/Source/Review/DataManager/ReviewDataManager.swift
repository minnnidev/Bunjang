//
//  ReviewDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import Foundation
import Alamofire

class ReviewDataManager {
    func getReview(seller: String, onCompletion: @escaping (ReviewResponse) -> Void) {
        let url = Constant.Base_URL + "/reviews/stores/\(seller)?start=0&offset=5"
        
        AF.request(url, method: .get).validate().responseDecodable(of: ReviewResponse.self) { response in
            switch response.result {
                case .success(let data):
                onCompletion(data)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
