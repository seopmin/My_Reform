//
//  LoginModel.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/16.
//

import Foundation

struct LoginModel : Decodable {
    var status : Int
    var code : String?
    var description : String?
    var token : String?
}

//struct LoginModelResult : Decodable {
//    var token : Token?
//}
//
//struct Token : Decodable {
//    var accessToken : String?
//    var refreshToken : String?
//}
