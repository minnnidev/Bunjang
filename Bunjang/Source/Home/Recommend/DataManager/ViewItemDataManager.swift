//
//  ViewItemDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/23.
//

import Foundation
import Alamofire

class ViewItemDataManager {
    func sendData(onCompletion: @escaping ([Result]) -> Void) {
        AF.request("https://makaroni.shop/items/all", method: .get).validate().responseDecodable(of: ViewItemResponse.self) { response in
            switch response.result {
                case .success(let data):
                    onCompletion(data.result)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
