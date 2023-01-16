//
//  LoginModel.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/16.
//

import Foundation

struct LoginModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : LoginModelResult?
    
}

struct LoginModelResult : Decodable {
    var token : Token?
}

struct Token : Decodable {
    var accessToken : String?
    var refreshToken : String?
}
