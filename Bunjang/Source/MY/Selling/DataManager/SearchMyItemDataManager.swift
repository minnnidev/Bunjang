//
//  SearchMyItemDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import Foundation
import Alamofire

class SearchMyItemDataManager {
    func getSearchMyItem(userIdx: Int, condition: String, itemName: String, onCompletion: @escaping (ViewSaleListResponse) -> Void) {
        let url = Constant.Base_URL + "/users/\(userIdx)/items/search?condition=\(condition)&itemName=\(itemName)&start=0&offset=10&sortCond=ASC"
        
        let safeURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        AF.request(safeURL, method: .get, headers: ["X-ACCESS-TOKEN": Secret.jwt]).responseDecodable(of: ViewSaleListResponse.self) { response in
            switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error)
            }
        }
    }
}

/*
 class ViewSaleListDataManager {
     func getData(userIdx: Int, condition: String, onCompletion: @escaping (ViewSaleListResponse)->Void) {
         AF.request("https://makaroni.shop/users/\(userIdx)/items?condition=\(condition)&start=0&offset=10&sortCond=DESC", method: .get)
             .validate()
             .responseDecodable(of: ViewSaleListResponse.self) { response in
                 switch response.result {
                     case .success(let data):
                         onCompletion(data)
                     case .failure(let error):
                         print(error)
                 }
             }
         
     }
 }
 */
