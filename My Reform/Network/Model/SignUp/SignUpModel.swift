//
//  SignUpModel.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/16.
//

import Foundation

struct SignUpModel: Decodable{
    var status: Int
    var code: String?
    var description : String
}
