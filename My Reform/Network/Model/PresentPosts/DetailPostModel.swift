//
//  DetailPostModel.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/26.
//

import Foundation

struct DetailPostModel : Decodable{
    let status : Int
    let code : String
    let message : String
    let data : [DetailPostData]?
}

struct DetailPostData : Decodable {
    
}
