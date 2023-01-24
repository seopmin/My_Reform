//
//  AllPostModel.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/19.
//

import Foundation


// 01.21 price와 imageURL 임의로 추가 - API명세서 확인 후 변경해야함 []

struct AllPostModel : Decodable {
    let status : Int
    let code : String
    let message : String
    let data : [AllPostData]?
}

struct AllPostData : Decodable {
    let boardId : Int?
    let categoryId : Int?
    let title : String?
    let updateAt : String?
    let price : Int?
    let imageUrl : String?
}
