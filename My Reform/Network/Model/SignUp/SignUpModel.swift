//
//  SignUpModel.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/16.
//

import Foundation

struct SingUpModel: Decodable{
    var isSuccess: Bool
    var code: Int
    var messsage : String?
    var result: String?
}
