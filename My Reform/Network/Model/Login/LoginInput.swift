//
//  LoginInput.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/16.
//

import Foundation

struct LoginInput: Encodable{
    var id: String?
    var pw: String?
    
    // 회원가입용 생성자
    init(id: String?, pw: String?) {
        self.id = id
        self.pw = pw
    }
}
