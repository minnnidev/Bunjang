//
//  AddDataManager.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/27.
//

import Foundation
import Alamofire

class AddManager {
    func postAddItem(parameters: AddRequest, onCompletion: @escaping (Bool) -> Void) {
        let url = Constant.Base_URL + "/items/sellers"
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate().responseDecodable(of: AddResponse.self) { response in
                switch response.result {
                case .success(let data):
                    if data.isSuccess {
                        onCompletion(true)
                        print("등록이 완료되었습니다.")
                    } else {
                        switch data.code {
                            case 1000:
                                print("1000")
                            case 2000:
                                print("error 2000")
                            case 2012:
                                print("2012")
                            case 2013:
                                print("2013")
                            case 2014:
                                print("2014")
                            case 2015:
                                print("2015")
                            case 2016:
                                print("2016")
                            case 2017:
                                print("2017")
                            case 2018:
                                print("2018")
                            default:
                                print("음")
                        }
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}


