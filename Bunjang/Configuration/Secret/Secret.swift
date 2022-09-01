//
//  Secret.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import Foundation

struct Secret {
    //내꼬
    static let jwt = "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjoxMSwiaWF0IjoxNjYxOTY1MTAwLCJleHAiOjE2NjM0MzYzMjl9.mp0NiyFFkB_JByktsyZt-wfxASCDVhBlxKxFRbMHDp0"
    //static let jwt = UserDefaults.standard.string(forKey: "jwt") as! String
    
    //user1꼬
    //static let jwt = "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjoxLCJpYXQiOjE2NjIwMTQ4NjgsImV4cCI6MTY2MzQ4NjA5N30.g0Io1FFf3u4KuiqEhXwUIu525x9bCRVhgmvt3wHJaew"
    static let headerJWT = ["X-ACCESS-TOKEN": jwt]
}
