//
//  AllPostModel.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/19.
//

import Foundation

struct SendAllPostModel: Decodable{
    let shard : [AllPostModel]?
}

// 01.20 price와 imageURL 임의로 추가 - API명세서 확인 후 변경해야함 []
struct AllPostModel : Decodable{
    let key : AllViewKey
    let value : AllViewValue?
}

struct AllViewKey : Decodable{
    let boardId : Int
    let user : AllViewUser
    let categoryId : Int
    let title : String
    let contents : String
    let createAt : String
    let updateAt : String
    let status : Int
    let price : Int
}


struct AllViewValue : Decodable {
    let boardImageId : Int?
    let boardId :Int?
    let image : AllViewImage?
    
    
}

struct AllViewUser : Decodable {
    let user_id : String
    let email : String
    let id : String
    let nickname : String
    let intrudution : String
}

struct AllViewImage : Decodable{
    let createAt : String?
    let updateAt : String?
    let status : Int?
    let imageId : Int?
    let imageURL : String?
}

