//
//  SignUpInput.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/16.
//

import Foundation

struct SignUpInput: Encodable{
    
    var id: String?
    var email: String?
    var pw: String?
    var nickname: String?
    var marketing: Bool?
    
    //email 유효성 검사용 생성자
    init(id: String, nickname: String) {
        self.id = id
        self.nickname = nickname
    }
    
    //회원가입용 생성자
    init(id: String, email: String, nickname: String, pw: String, marketing: Bool) {
        self.id = id
        self.email = email
        self.nickname = nickname
        self.pw = pw
        self.marketing = marketing
    }
    
}
